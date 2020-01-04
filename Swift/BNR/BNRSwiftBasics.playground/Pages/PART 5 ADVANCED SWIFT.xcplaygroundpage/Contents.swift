//: [Previous](@previous)

import Foundation



//: ### CHAPTER 19 PROTOCOLS
// Protocol Inheritance

//protocol TabularDataSource: CustomStringConvertible
//anything that conforms to TabularDataSource, also conforms to CustomStringConvertible


// Protocol Composition
//func printTable(dataSource: TabularDataSource & CustomStringConvertible) {
//    print("Table: \(dataSource.description)")
//    ...
//}
//: ### CHAPTER 20 ERROR HANDLING

//
//enum Token{
//     case number(Int)
//     case plus
//}
//
//
//class Lexer{
//
//    enum Error:Swift.Error{
//        case invalidCharacter(Character)
//    }
//
//
//    let input:String.CharacterView
//    var position:String.CharacterView.Index
//
//    init(input:String){
//        self.input = input.characters
//        self.position = self.input.startIndex
//    }
//
//    func peek()->Character?{
//        guard position < input.endIndex else{
//            return nil
//        }
//        return input[position]
//    }
//
//    func advance(){
//        assert(position < input.endIndex, "Cannot advance past endIndex!")
//        position = input.index(after: position)
//    }
//
//    func getNumber()-> Int{
//        var value = 0
//
//        while let nextCharacter = peek(){
//            switch nextCharacter {
//            case "0" ... "9":
//                // andther digit add it to value
//                let digitValue = Int(String(nextCharacter))!
//                value = 10*value + digitValue
//                advance()
//            default:
//                // a non-digit - go back to regular lexing
//                return value
//            }
//        }
//    }
//
//    func lex() throws -> [Token]{
//        var tokens = [Token]()
//
//        while let nextCharacter = peek(){
//            switch nextCharacter {
//            case "0" ... "9":
//                // start of a number grab the rest
//                let value = getNumber()
//                tokens.append(.number(value))
//            case "+":
//                tokens.append(.plus)
//            case " ":
//                advance()
//            default:
//                // Something unexpected - need to send back an error
//                throw Lexer.Error.invalidCharacter(nextCharacter)
//            }
//        }
//    }
//}



//: ### CHAPTER 21 EXTENSIONS


//: ### CHAPTER 22 GENERICS


//: ### CHAPTER 23 PROTOCOL EXTENSIONS


//: ### CHAPTER 24 ARC


//: ### CHAPTER 25 EQUITABLE


//: [Next](@next)
