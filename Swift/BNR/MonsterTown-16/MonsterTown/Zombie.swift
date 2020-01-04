//
//  Zombie.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation


class Zombie: Monster {
    
//    class func makeSpookyNoise() -> String {
//        return "Brains..."
//    }
//    making computed for function that have no parameters -- get keyword ignored if there is no setter
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLimp = true
    internal private(set) var isFallingapart = false // setter cannot be more visibile than getter // leave out internal thats default
    
    override func terrorizeTown() {
        if isFallingapart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
    }
}
