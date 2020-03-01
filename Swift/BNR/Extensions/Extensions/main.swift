//
//  main.swift
//  Extensions
//
//  Created by Lakshmi on 7/15/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation

typealias Velocity = Double
extension Velocity {
    var kph: Velocity { return self * 1.609 }
    var mph : Velocity { return self }
    
}

protocol Vehicle {
    var topSpeed: Velocity { get }
    var numberOfDoors : Int { get }
    var hasFlatbed : Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
}

//protocol to extension

extension Car: Vehicle {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return 4 }
    var hasFlatbed: Bool { return false }
    
}
// init for extension

extension Car {
    init(make: String, model: String, year: Int) {
        self.init(make: make,
                  model: model,
                  year: year,
                  color: "Black",
                  nickname: "N/A",
                  gasLevel: 1.0)
    }
}

// nested types

extension Car {
    enum Kind {
        case coupe, sedan
    }
    
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
}
var c = Car(make: "Ford", model: "Fusion", year: 2013)
print(c.kind)

// extension with functions

extension Car {
    mutating func emptyGas(by amount: Double) {
        precondition(amount <= 1 && amount > 0, "Amount to be removed must be between 0 and 1")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}
print(c.emptyGas(by: 0.3))
print(c.gasLevel)
print(c.fillGas())
print(c.gasLevel)








