//
//  main.swift
//  Generics
//
//  Created by Lakshmi on 7/16/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation

struct StackIterator<T>: IteratorProtocol {
    
//    typealias Element = T
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element]()
    
//    mutating func pushAll(_ array: [Element]) {
//        for item in array {
//            self.push(newItem: item)
//        }
//    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for item in sequence {
            self.push(newItem: item)
        }
    }
    
    mutating func push(newItem:Element) {
        items.append(newItem)
    }
    
    mutating func pop()-> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func mapStack<U>(f:(Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        
        return Stack<U>(items:mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

var intStack = Stack<Int>()

intStack.push(newItem: 1)
intStack.push(newItem: 2)
intStack.push(newItem: 3)
intStack.push(newItem: 4)

print("stack:")
print(intStack.items)


var doubledStack = intStack.mapStack() {
    (value: Int) -> Double in
    return 2.0 * Double(value)
}


//var stringStack = Stack<String>()
//
//stringStack.push(newItem: "1")
//print(stringStack.pop())

// Generic functions

func myMap<T,U>(_ items:[T],_ f:(T)->(U)) -> [U]{
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one","two","three"]
let stringLengths = myMap(strings) {$0.count}
print("string lengths:")
print(stringLengths)


//MARK: type constants

func checkEqual<T: Equatable> (first: T,second: T) -> Bool {
    return first == second
}

//MARK: Associated type



var myStack = Stack<Int>()
myStack.push(newItem: 10)
myStack.push(newItem: 20)

var myStackIterator = StackIterator(stack: myStack)

print("Iterator:")
while let value = myStackIterator.next() {
    print("got \(value)")
}
print(myStackIterator.stack.items)
print(myStack.items)

print("Sequence:")

for value in myStack {
    print("got \(value)")
}


myStack.pushAll([1, 2 , 3])

print("After pushing:")
for value in myStack {
    print("got \(value)")
}


var myOtherStack = Stack<Int>()
myOtherStack.pushAll([9, 99, 999])
myStack.pushAll(myOtherStack)

print("Sequence push all:")
for value in myStack {
    print("got \(value)")
}


// https://www.hackingwithswift.com/example-code/language/what-is-a-protocol-associated-type

print("Associated type:")

protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

class NameDatabase: ItemStoring {
    var items = [String]()
}

var names = NameDatabase()
names.add(item: "James")
names.add(item: "Jess")

print(names.items)
















