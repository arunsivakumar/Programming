//
//  main.swift
//  ARC
//
//  Created by Lakshmi on 1/14/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//


import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant  = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        accountant.netWorthChangedHandler = { // escaping
            [weak self]netWorth in
            
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
//        asset.owner = self
//        assets.append(asset)
//        accountant.gained(asset)
        accountant.gained(asset) { 
            asset.owner = self
            assets.append(asset)
        }
    }
    
    func netWorthDidChange(to netWorth: Double){
        print("the networth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Double) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
}

var bob: Person? = Person(name: "Bob")
print("created \(String(describing: bob))")



var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)


//bob = nil
//print("the bob variable is now \(String(describing: bob))")
//
//laptop = nil
//hat = nil
//backpack = nil
bob?.useNetWorthChangedHandler(handler: { (networth) in
    print("bob's networth is now \(networth)")
})
bob?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: hat!)

bob = nil
print("the bob variable is now \(String(describing: bob))")

laptop = nil
hat = nil
backpack = nil

