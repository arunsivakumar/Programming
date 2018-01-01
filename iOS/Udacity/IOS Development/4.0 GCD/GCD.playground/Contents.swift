//: Playground - noun: a place where people can play

import UIKit

let f = {(x:Int) -> Int
    in return x+42
}


f(9)

let closures = [f,{(x:Int) in x*x}]

typealias Integer = Int
let z:Integer = 42

typealias IntToInt = (Int)->Int
typealias IntMaker = (Void)->Int


func makeCounter()->IntMaker{
    
    var n = 0
    
    func adder()->Int{
        n = n + 1
        return n
    }
    
    return adder
    
}

let counter1 = makeCounter()
let counter2 = makeCounter()

counter1()
counter1()
counter1()

counter2()


var value = 5

func compute(){
    value = value + 5
}

let q1 = dispatch_queue_create("q1", nil)
let q2 = dispatch_queue_create("q2", nil)
let q3 = dispatch_queue_create("q3", nil)

dispatch_async(q1) { ()-> Void in
    print(1)
}


dispatch_async(q2) { ()-> Void in
    print(2)
}


dispatch_async(q3) { ()-> Void in
    print(3)
}


print("end")


var multiply :(Int,Int)->Int = {$0 * $1}

multiply(1,2)

var comeOn:()->Void = {
    
    print("Hello")
}

let variablecomeon = comeOn()
variablecomeon







