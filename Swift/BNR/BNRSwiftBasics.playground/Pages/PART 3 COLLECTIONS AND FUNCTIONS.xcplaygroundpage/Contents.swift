//: [Previous](@previous)


//: # PART 3 - COLLECTIONS AND FUNCTIONS

import Foundation

//: ## CHAPTER 9 - ARRAYS

//: + Can hold any sort of value /   object and non objects unlike obj-c
//: + Ordered

//: ###### Creating an array
var bucketList = ["Climb Mt. Everest"] // type inference
//: ###### Accessing and modifying arrays
bucketList.append("Fly to fiji")
//bucketList.remove(at: 3) // error/crash
bucketList.remove(at: 1)
bucketList
print(bucketList.count)
print(bucketList[0...0])

bucketList.append("go on a walk about")
bucketList[1] += " in Australia"
print(bucketList)
bucketList[0] = "Climb mt 2"

bucketList.removeAll()

var newItems = ["Climb mt 2", "go on a walk about"]

//for item in newItems{
//    bucketList.append(item)
//}

//: * instead do this 

bucketList += newItems
bucketList.insert("Do laundry", at: 0)


//: ###### Array Equality

newItems.insert("Do laundry", at: 1)
let equal = (bucketList == newItems) // because arrays are ordered

//: ###### Immutable arrays

let lunches = ["Burger","Pizza"]


//: ## CHAPTER 10 - DICTIONARIES
//: * key must be hashable (String, in , float , double, Bool) are all hashable - Swift Basic Types

//: ###### Creating Dictionary

var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()

//: ###### Populating

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]


//: ###### Accessing and modifying dictionary

print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"] // type is an optional

//movieRatings["Dark City"] = 5

//: * Returns an optional with old value

let oldRating = movieRatings.updateValue(5, forKey: "Dark City")
oldRating

movieRatings

//: ###### Adding and removing values

movieRatings["The Cabinet of Dr. Caligari"] = 5


//: * Returns an optional with old value

let removedRating:Int? = movieRatings.removeValue(forKey: "Dark City")
//movieRatings["Dark City"] = nil // alt

//: ###### Loopping

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

//: ###### Immutable Dictionaries

//make it let

//: ###### Dictionary to Array

let watchedMovies = Array(movieRatings.keys)


//: ## CHAPTER 11 - SETS

//: * unordered collection for distinct instances


//: ###### Getting a set

//var groceryBag = Set<String>()
//groceryBag.insert("Apples") // returns tuple
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")

//var groceryBag = Set<String>(["Apples", "Oranges", "Pineapple"])
var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]

groceryBag.insert("Apples")
groceryBag.insert("Oranges")
groceryBag.insert("Pineapple")

for food in groceryBag {
    print(food)
}

//: ###### Working with sets

let hasBananas = groceryBag.contains("Bananas")

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])

//: * you can pass Sequence protocol (Arrays and Sets) to union
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
// intersection
// isDisjoint

//: ## CHAPTER 12 - FUNCTIONS

//: ######  Basic function
//: ######  Function parameters
func printPersonalGreeting(name: String) {
    print("Hello \(name), welcome to your playground.")
}
printPersonalGreeting(name: "Matt")


//: ######  Parameter names

func printPersonalGreeting(to name: String) { //to external parameter name
    print("Hello \(name), welcome to your playground.")
}
printPersonalGreeting(to: "Matt")

func divisionDescriptionFor(numerator: Double, denominator: Double) { // for preposition for multiple parameters
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)

//: ######  Variadic parameters
func printPersonalGreetings(to names:String...){ // last parameter
    for name in names{
        print("Hello \(name),welcome to playground.")
    }
}
printPersonalGreetings(to: "alex","chris")

//: ######  Default parameter values

func divisionDescriptionForValues(numerator: Double,
                                  denominator: Double,
                                  withPunctuation punctuation: String = ".") {
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}
divisionDescriptionForValues(numerator: 9.0, denominator: 3.0)
divisionDescriptionForValues(numerator: 9.0, denominator: 3.0, withPunctuation: "!")

//: ######  in-out parameters 1.no default value 2.varaidic cannot be in-out
//: * inout cannot have default values
//: * variadic parameters cannot be marked in/out
//: * appendErrorcode the first external parameter is suppressed

var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error



//: ######  Returning from function - return keyword
  //use return keyword
//: ######  Nested Functions and Scope
//: * Nested function is not available outside of enclosing function

func areaOfTriangleWith(base: Double, height: Double) -> Double {
    let numerator = base * height
    
//: * numerator shared by enclosing scope
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangleWith(base: 3.0, height: 5.0)


//: ######  Multiple returns

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

//: ######  Optional return type
func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt",nil,"Mathias"))
if let theName = middleName {
    print(theName)
}
//: ######  Exiting early from function
func greetByMiddleName(fromFullName name: (first: String,
    middle: String?,
    last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Matt","Danger","Mathias"))
//: ######  Function types

let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumbers
evenOddFunction([4,2,5])

//:  ## CHAPTER 13 - CLOSURES
//: ######  Closeure syntax
let volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

//: ######  Closure expression syntax
let volunteersSorted2 = volunteerCounts.sorted { $0 < $1 }
volunteersSorted2

//: ######  Function as return types
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


//: ######  Function as Arguments
func makeTowmGrand(withBudget budget:Int, condition:(Int) -> Bool) -> ((Int,Int) -> Int)?{
    if condition(budget){
        
        func buildRoads(byAddingLights lights:Int, toExistingLights existingLights:Int) -> Int{
            return lights + existingLights
        }
        
        return buildRoads
    }else {
        return nil
    }
}

func evaluate(budget:Int) -> Bool{
    return budget > 10_000
}

var stopLights = 4
if let townPlanning = makeTowmGrand(withBudget: 10_000, condition: evaluate){
    stopLights = townPlanning(4,stopLights)
}

print(stopLights)
//: ######  Closure captures values ###
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

//: ######  Closure are reference types

let anotherGrowBy = growBy
anotherGrowBy!(500) // another growBy points to the same function as grow by current population is not changed

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
currentPopulation

//: ######  Functional programming
//: ###  Map - filter - reduce
//: ###### Map - transform arrays contents
let precintPopulations = [1243,2345,3455]

let projectedPopulation = precintPopulations.map { (population:Int) -> Int in
    return population * 2
}

print(projectedPopulation)

//: ######  Filter
let bigProjections = projectedPopulation.filter { (projection) -> Bool in
    return projection > 4000
}
bigProjections

//: ###### Reduce - reduce the array value to a single value
let totalProjection = projectedPopulation.reduce(0) { (accumulator:Int, precintProjection:Int) -> Int in
    return accumulator + precintProjection
}
totalProjection

//: [Next](@next)
