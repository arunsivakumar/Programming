//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func justDoIt( it: @escaping (Void) -> Void) {
    it() // the `it` closure never escapes the body of the function
}


justDoIt {
    print("Hello")
}

