//
//  main.swift
//  Generics
//
//  Created by Lakshmi on 7/16/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


struct Stack<Element>{
    var items = [Element]()
    
    mutating func push(newItem:Element){
        items.append(newItem)
    }
    
    mutating func pop()-> Element?{
        guard !items.isEmpty else{
            return nil
        }
        return items.removeLast()
    }
    
    func mapStack<U>(f:(Element) -> U) -> Stack<U>{
        var mappedItems = [U]()
        for item in items{
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items:mappedItems)
    }
}

var intStack = Stack<Int>()

intStack.push(newItem: 1)
//print(intStack.pop())

var doubledStack = intStack.mapStack(f:
    {
    (value: Int) -> Int in
        return 2 * value
    }
)

//func doubleIt(value: Int) -> Int{
//    return 2 * value
//}

for value in doubledStack.items{
    print(value)
}


//var stringStack = Stack<String>()
//
//stringStack.push(newItem: "1")
//print(stringStack.pop())

// Generic functions

func myMap<T,U>(_ items:[T],_ f:(T)->(U)) -> [U]{
    var result = [U]()
    for item in items{
        result.append(f(item))
        
    }
    return result
}

let strings = ["one","two","three"]
let stringLengths = myMap(strings) {$0.characters.count}
print(stringLengths)





// type constants

func checkEqual<T: Equatable> (first: T,second: T) -> Bool{
    return first == second
}

// Associated type

struct stackIterator<T>: IteratorProtocol{
    
//    typealias Element = T
    var stack:Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(newItem: 10)
myStack.push(newItem: 20)

var myStackIterator = stackIterator(stack: myStack)

while let value = myStackIterator.next(){
    print("got \(value)")
}

//### Sequence






// PROTOCOL EXTENSION




























