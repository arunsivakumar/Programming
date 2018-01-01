//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Lakshmi on 10/21/16.
//  Copyright © 2016 Arun. All rights reserved.
//

import Foundation
//
//func multiply(op1:Double,op2:Double) -> Double{
//    return op1*op2
//}

class CalculatorBrain{
    
    private var accumulator = 0.0
    
    func setOperand(operand:Double){
        accumulator = operand
    }
    
    func performOperation(symbol:String){
        
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value // swift kow Operation.constant
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
        //        if let constant = operations[symbol]{
        //            accumulator = constant
        //        }
        //        switch symbol{
        //        case "π": accumulator = M_PI
        //        case "√": accumulator = sqrt(accumulator)
        //        default: break
        //        }
    }
    var result:Double{
        get{
            return accumulator
        }
    }
    
    private var operations:Dictionary<String,Operation> = [
        "±" : Operation.UnaryOperation({-$0}),
        "π" : Operation.Constant(M_PI), //  enum has associated values
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "−" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals
    ]
    
    private enum Operation{ // optional is an enum, enum has associated values
        case Constant(Double)
        case UnaryOperation((Double)->Double)   // function , double type
        case BinaryOperation((Double,Double) -> Double)
        case Equals
        
        // computed vars , no stored vars , no inheritance, have function, pass by value
        
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }
        
    }
    
    private var pending:PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo{
        var binaryFunction:(Double,Double) -> Double
        var firstOperand:Double
        
    } // no inheritance like enum, passed by value
    
    
}
