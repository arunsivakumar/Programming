//: [Previous](@previous)


//: # PART 4 ENUM STRUCTURES AND CLASSES

import Foundation


//:  ## CHAPTER 14 - ENUM

//: ###### Basic enum

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

//: ###### Raw value enum

// * doenst have integer value instead use raw value
print(TextAlignment.right.rawValue) // change enum TextAlignment:Int{

//: * case left = 20 change
//: * raw values useful for conversion

let myRawValue = 21
if let myAlignment = TextAlignment(rawValue: myRawValue){ //myAlignment holds enum -> return type optional
    print("conversion successful \(myAlignment)")
}else{
    print("conversion failed")
}

enum ProgrammingLanguage:String{
    case swift4 // default conversion
    case java = "java"
}

let myFavouriteLanguage = ProgrammingLanguage.swift4
print("My fav lang - \(myFavouriteLanguage.rawValue)") // you can omit enum raw value assignment

//: ###### Methods

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
    
    func state() -> LightBulb{
        switch self {
        case .on:
            return .on
        default:
            return .off
        }
    }
}

var bulb = LightBulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfacetemperature(forambientTemperature: ambientTemperature)
print("the bulbs ambient temperature \(bulbTemperature)")

bulb.toggle()
bulb.state()

var anotherBulb = LightBulb.on
anotherBulb.state()
//: ###### Associated values
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

//: ###### TODO Recursive enumerations


//: ---
//:  ## CHAPTER 15 - STRUCT - CLASSES
//: ### Struct
//: ###### Instance methods
//: ###### Mutating methods
//: ### Classes
//: ###### Inheritance
//: ###### Type methods
//: ###### Mutating methods

// struct methods are mutating
// classes have inheritance
// classes method can override super method
// final to not override 

//final override func terrorizeTown() {
//    if  let terrorTown = town, terrorTown.population > 10{ user optional chaining to solve the problem
//        town?.changePopulation(by: -10) // if you user terror town it wont reflect town
//    }
//    super.terrorizeTown()
//    
//}

//: ### Type Methods
//: * type methods can work with type mentods not instance methods

struct Square {
    static func numberOfSides() -> Int {
        return 4
    }
}

//: * use static or final for sublass not to override
class Zombie {
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
}

let sides = Square.numberOfSides() // sides is 4
let spookyNoise = Zombie.makeSpookyNoise() // spookyNoise is "Brains...

// subclass could override

class GiantZombie: Zombie {
    override class func makeSpookyNoise() -> String {
        return "ROAR!"
    }
}


//: ###### TODO Mutating Func

//: ---
//:  ## CHAPTER 16  - PROPERTIES
//: ###### Stored
//: ###### Nested types
//: ###### Lazy stored properties
//: ###### Computed
//: ###### Property observers
//: ###### Type properties
//: ###### Access control
//create lazy with var because value changes

//    lazy var townSize:Size = { // lazy takes a clouser computes only once - calculated only once use computer if you want to recaulculate
//        switch self.population{
//        case 0...10000:
//            return Size.small
//        case 10000...100001:
//            return Size.medium
//        default:
//            return Size.large
//
//        }
//    }() - Paranthesis for execution

// unlike stored read only properties, Computer properties defined using var
// should have a type so compiler will know what to return

//var townSize:Size { // provide type
//    get{
//        switch self.population{
//        case 0...10_000:
//            return Size.small
//        case 10_000...100_001:
//            return Size.medium
//        default:
//            return Size.large
//            
//        }
//    }
//}

// static vs class property static cannot be overridden, type could be
//: ---
//: ## CHAPTER 17  - INIT
//: ###### Struct init
//: ###### Class init
//: ###### Failable init

//: ---
//: ## CHAPTER 18  - VALUE VS REFERENCE TYPES
//: ###### Value semantics
var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"
str

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}
let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name
//: ###### Constant value and reference types
struct Pantheon{
    var chiefGod: GreekGod //“be very careful about using a reference type inside of a value type” use immutable instance
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
//pantheon.chiefGod = zeus //error as it is a value type
zeus.name = "Zeus Jr"
zeus.name


//: ###### Using value and reference types together
pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name
//: ###### Copying
// copies are shallow

let athena = GreekGod(name: "Athena")

let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

// A deep copy, on the other hand, would duplicate the instance at the destination of a reference
//: ###### Equality vs identity
// == for values types
// === for reference types
//: ###### Copy on write

// TODO
//: [Next](@next)
