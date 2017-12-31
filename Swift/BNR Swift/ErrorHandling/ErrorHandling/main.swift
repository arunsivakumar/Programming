//
//  main.swift
//  ErrorHandling
//
//  Created by Lakshmi on 7/15/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


enum Token{
    case number(Int)
    case plus
    case minus
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
        return value
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
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case " ":
                advance()
            default:
                // Something unexpected - need to send back an error
                throw Lexer.Error.invalidCharacter(nextCharacter)
            }
        }
        
        return tokens
    }
}

//func evaluate(_ input:String){
//    print("Evaluating: \(input)")
//    let lexer = Lexer(input:input)
//    
//    do{
//        let tokens = try lexer.lex()
//        print("Lexer output:\(tokens)")
//    }catch{
//        print("An error occoured: \(error)")
//    }
//}


//evaluate("10 + 34 + 5")
//evaluate("1 + 2 + abcdef")





class Parser{
    
    enum Error:Swift.Error{
        case unexpectedEndOfInput
        case invalidToken(Token)
    }
    
    
    let tokens:[Token]
    var position = 0
    
    
    init(tokens:[Token]){
        self.tokens = tokens
    }
    
    
    func getNextToken() -> Token?{
        guard position < tokens.count else{
            return nil
        }
        
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int{
        guard let token = getNextToken() else{
            throw Parser.Error.unexpectedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
        case .minus:
            throw Parser.Error.invalidToken(token)
        }
    
    }
    
    func parse() throws -> Int{
        
        //  first one should always be a numnber
        var value = try getNumber()
        
        while let token = getNextToken() {
            
            switch token {
            case .plus:
                // after a plus we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            
            case .minus:
                // after a plus we must get another number
                let nextNumber = try getNumber()
                value -= nextNumber
                
                //getting a number after plus is not legal
            case .number(_):
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
}
// takeaway
// 1. Errors thrown - need not stick with a particular error type
// 2. handle error unknown type in catch
func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.invalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.unexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 5 - 2")

