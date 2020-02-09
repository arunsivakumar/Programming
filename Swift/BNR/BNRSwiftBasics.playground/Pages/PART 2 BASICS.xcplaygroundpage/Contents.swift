
//: # PART 2 BASICS

//: ## CHAPTER 3 - CONDITIONALS if/else
var population: Int = 5422
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town!"
} else {
message = "\(population) is pretty big!"
}
print(message)
print("Hello World")

if hasPostOffice {
    print("where do they buy stamps?")
}
//: ---


//: ## CHAPTER 4 - NUMBERS
print("\(Int.max)")
print("\(Int.min)")
print("\(UInt.max)")
print("\(UInt.min)")

let x: Int8 = 120
let z = x &+ 10
//let a = 7.0 % 3.5
////: ---
let d1 = 1.1
let d2 = 1.1
if (d1 + 0.1 == 1.2) {
    print("d1 and d2 are same")
} else {
    print(d1 + 0.1)
    print("not same")
}


//: ## CHAPTER 5 - SWITCH
//: * Should have atleast one statement
//: * Range is inclusive
//: * Interval Matching (Range ...), Pattern Matching (Tuples)
var statusCode = 203;
var errorString: String = "The request failed: "

switch statusCode {
case 200:
    errorString += "no error:"
    fallthrough
case 400...499:
    errorString += "error:"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300 || unknownCode > 505):
    errorString += "\(unknownCode) is not an error code."
default:
    errorString += "please review the request"
}

print(errorString)
//: ###### Value Binding
//:
switch statusCode {
case 400...404:
    errorString = "Client error, \(statusCode)."

//: ###### Where Clause
//: * can chage with var, use default instead
case let unknownCode where (unknownCode >= 200 && unknownCode <= 300):
    errorString = "\(unknownCode) is not a known error code."
    
default:
    errorString += "Please review and try again."
}

print(errorString)


//: ###### Tuples and Pattern Matching
//: * Naming tuples
let networkError = (code: statusCode, error: errorString)


switch statusCode {
case 200:
    errorString += "no error:"
    fallthrough
case 400...499:
    errorString += "error:"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300 || unknownCode > 505):
    errorString += "\(unknownCode) is not an error code."
default:
    errorString += "please review the request"
}

print(errorString)
//networkError.0
//networkError.1

networkError.code
networkError.error

//: ###### Matching Patterns
let firstErrorCode = 404
let secondErrorCode = 200

let errorCodes = (firstErrorCode,secondErrorCode)

switch errorCodes {
case (404,404):
    print("No items found")
case (404,_):
    print("First item not found")
case (_,404):
    print("Second item not found")
default:
    print("All items found")
}


//: ###### Switch vs if/else
let age = 25

if case 18...35 = age, age > 21{
    print("Cool age")
}

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
    
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
    
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
    
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
    
case (_, 0):
    print("\(point) sits on the x-axis")
    
case (0, _):
    print("\(point) sits on the y-axis")
    
default:
    print("Case not covered.")
}




//: ---

//: ## CHAPTER 6 - LOOPS
for i in 1...100 where i % 3 == 0 {
    print(i)
}
//: ---


//: ## CHAPTER 7 - STRINGS

//: ---


//: ## CHAPTER 8 - OPTIONALS

var errorCodeString: String?
errorCodeString = "404"

//: ###### optional binding

if let theError = errorCodeString {
    print(theError)
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}

//: ###### implictly unwrapped

var errorCodeString2:String! = nil
//let anotherErrorCodeString: String = errorCodeString2 // Will this work? // ans: run time error
let yetAnotherErrorCodeString = errorCodeString2 // Optional or implicitly unwrapped?” ans:optional


//: ###### optional chaining
//var errorCodeString: String?
//errorCodeString = "404"
//var errorDescription: String?
//if let theError = errorCodeString, let errorCodeInteger = Int(theError),
//    errorCodeInteger == 404 {
//    print("\(theError): \(errorCodeInteger)")
//    errorDescription = "\(errorCodeInteger + 200): resource was not found."
//}
//
//var upCaseErrorDescriptionForError = errorDescription?.uppercased()
//errorDescription
//: ###### Modifiying an optional in place
var errorDescription: String?
var upCaseErrorDescription = errorDescription?.uppercased()

//: ###### modifying optional in place

upCaseErrorDescription = "502"
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription

//: ###### nil coalescing operator

let description = errorDescription ?? "No Error"


//: ---
