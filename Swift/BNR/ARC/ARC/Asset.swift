//
//  Asset.swift
//  ARC
//
//  Created by Lakshmi on 1/14/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation


class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}

// Person owns asset : so weak reference for person inside asset
// weak should be var & Optional
