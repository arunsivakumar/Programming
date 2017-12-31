//: Playground - noun: a place where people can play

import UIKit


// ----------------------------- chapter 8 - OPTIONALS

var errorCodeString: String?
errorCodeString = "404"

 // optional binding

if let theError = errorCodeString {
    print(theError)
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}

//implictly unwrapped

var errorCodeString2:String! = nil
//let anotherErrorCodeString: String = errorCodeString2 // Will this work? // ans: run time error
let yetAnotherErrorCodeString = errorCodeString2 // Optional or implicitly unwrapped?” ans:optional


// optional chaining

var errorDescription: String?
var upCaseErrorDescription = errorDescription?.uppercased()

// modifying optional in place

upCaseErrorDescription = "502"
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription

// nil coalescing operator

let description = errorDescription ?? "No Error"

// ----------------------------- chapter 12 - FUNCTIONS

// basic function
// function parameters
func printPersonalGreeting(name: String) {
    print("Hello \(name), welcome to your playground.")
}
printPersonalGreeting(name: "Matt")


// parameter names

func printPersonalGreeting(to name: String) { //to external parameter name
    print("Hello \(name), welcome to your playground.")
}
printPersonalGreeting(to: "Matt")

func divisionDescriptionFor(numerator: Double, denominator: Double) { // for preposition for multiple parameters
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)

// variadic parameters
func printPersonalGreetings(to names:String...){ // last parameter
    for name in names{
        print("Hello \(name),welcome to playground.")
    }
}
printPersonalGreetings(to: "alex","chris")
// default parameter values

func divisionDescriptionForValues(numerator: Double,
                               denominator: Double,
                               withPunctuation punctuation: String = ".") {
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}
divisionDescriptionForValues(numerator: 9.0, denominator: 3.0)
divisionDescriptionForValues(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

// in-out parameters 1.no default value 2.varaidic cannot be in-out
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error


// Returning from function - return keyword
// Nested Functions and Scope
func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double { // numerator shared by enclosing scope
        return numerator / 2
    }
    return divide()
}
areaOfTriangleWith(base: 3.0, height: 5.0)
// Multiple returns

func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens) the odd numbers are: \(theSortedNumbers.odds)")

// optional return type
// Exiting early from function
// function types
let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers
evenOddFunction([4,2,5])






// ----------------------------- chapter 13 - CLOSURES

// closeure syntax


let volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

// closure expression sntax
let volunteersSorted2 = volunteerCounts.sorted { $0 < $1 }
volunteersSorted2

// function as return types

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(byAddingLights lights: Int,
                    toExistingLights existingLights: Int) -> Int {
        return lights + existingLights
    }
    return buildRoads
}
var stoplights = 4
let townPlanByAddingLightsToExistingLights = makeTownGrand()
stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
print("Knowhere has \(stoplights) stoplights.")


// function as arguments



// closure captures values ###


func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
var growBy :((Int)->Int)? = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy!(500)
growBy!(500)
growBy!(500)
currentPopulation = growBy!(500) // currentPopulation is now 7422
//growBy = nil // added to check

// closure are reference types

let anotherGrowBy = growBy
anotherGrowBy!(500) // another growBy points to the same function as grow by current population is not changed

// functional programming
// map - filter - reduce


//map - transform arrays contents
let precintPopulations = [1243,2345,3455]

let projectedPopulation = precintPopulations.map { (population:Int) -> Int in
    return population * 2
}

print(projectedPopulation)
// filter

let bigProjections = projectedPopulation.filter { (projection) -> Bool in
    return projection > 4000
}
bigProjections

//reduce - reduce the array value to a single value
let totalProjection = projectedPopulation.reduce(0) { (accumulator:Int, precintProjection:Int) -> Int in
    return accumulator + precintProjection
}
totalProjection

// ----------------------------- chapter 14 - ENUM

//basic enum

enum TextAlignment:Int{
    case left = 20
    case right
    case center
}

var alignment = TextAlignment.left
alignment = .right
//if alignment == .right{
//    print("right alignment")
//}

switch alignment { // should be exhaustive
case .left:
    print("left")
default: // dont use default be exhaustive
    print("default")
}

//raw value enum

//# doenst have integer value instead use raw value
print(TextAlignment.right.rawValue) // change enum TextAlignment:Int{

//case left = 20 change

// raw values useful for conversion

let myRawValue = 21
if let myAlignment = TextAlignment(rawValue: myRawValue){ //myAlignment holds enum -> return type optional
    print("conversion successful \(myAlignment)")
}else{
    print("conversion failed")
}

enum ProgrammingLanguage:String{
    case swift = "swift"
    case java = "java"
}

let myFavouriteLanguage = ProgrammingLanguage.swift
print("My fav lang - \(myFavouriteLanguage.rawValue)") // you can omit enum raw value assignment

//methods

enum LightBulb{
    case on
    case off
    
    func surfacetemperature(forambientTemperature ambient:Double)->Double{
        switch self {
        case .on:
            return ambient + 150.0
        default:
            return ambient
        }
    }
    
    mutating func toggle(){ // enumeration is a value type
        switch self{
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = LightBulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfacetemperature(forambientTemperature: ambientTemperature)
print("the bulbs ambient temperature \(bulbTemperature)")

bulb.toggle()

//associated values
//attach data  to instances and different cases havce different associated values

enum shapeDimensions{
    case square(side:Double)
    case rectangle(width:Double,height:Double)
    case point
    func area()->Double{
        switch self {
        case let .square(side:s):
            return s * s
        case let .rectangle(width:w,height:h):
            return w * h
        case .point:
            return 0
        }
    }
}

var squareShape = shapeDimensions.square(side: 10.0)
var rectShape = shapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointshape = shapeDimensions.point

squareShape.area()
rectShape.area()
pointshape.area()

//recursive enumerations


//-----------------------------  chapter 15 - STRUCT - CLASSES

// struct

//instance methods
//mutating methods

//classes

// inheritance
// type methods
// mutating methods




// ----------------------------- chapter 16  - PROPERTIES

// sotred
//nested types
//lazy stored properties
//computed
//property observers
//type properties
//access control

//-----------------------------  chapter 17  - INIT

//struct init
//class init
//failable init


// ----------------------------- chapter 18  - VALUE VS REFERENCE TYPES


//value semantics
//reference semantics
//constant value and reference types
// using value and reference types together
//copying
//equality vs identity

//copy on write


// chapter 19 PROTOCOLS


// chapter 20 ERROR HANDLING


enum Token{
     case number(Int)
     case plus
}


class Lexer{
    
    enum Error:Swift.Error{
        case invalidCharacter(Character)
    }
    
    
    let input:String.CharacterView
    var position:String.CharacterView.Index
    
    init(input:String){
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek()->Character?{
        guard position < input.endIndex else{
            return nil
        }
        return input[position]
    }
    
    func advance(){
        assert(position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    func getNumber()-> Int{
        var value = 0
        
        while let nextCharacter = peek(){
            switch nextCharacter {
            case "0" ... "9":
                // andther digit add it to value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                // a non-digit - go back to regular lexing
                return value
            }
        }
    }
    
    func lex() throws -> [Token]{
        var tokens = [Token]()
        
        while let nextCharacter = peek(){
            switch nextCharacter {
            case "0" ... "9":
                // start of a number grab the rest
                let value = getNumber()
                tokens.append(.number(value))
            case "+":
                tokens.append(.plus)
            case " ":
                advance()
            default:
                // Something unexpected - need to send back an error
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
    }
}







































// chapter 21 EXTENSIONS
// chapter 22 GENERICS
// chapter 23 PROTOCOL EXTENSIONS
// chapter 24 ARC
// chapter 25 EQUITABLE
