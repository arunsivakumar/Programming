
//: # PART 2 BASICS


//: ## CHAPTER 3 - CONDITIONALS if/else

//: ---


//: ## CHAPTER 4 - NUMBERS


//: ---


//: ## CHAPTER 5 - SWITCH
//: * Should have atleast one statement
//: * Range is inclusive
//: * Interval Matching (Range ...), Pattern Matching (Tuples)
var statusCode = 200;
var errorString = "The request failed:"

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
let networkError = (code: statusCode,error: errorString)
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
