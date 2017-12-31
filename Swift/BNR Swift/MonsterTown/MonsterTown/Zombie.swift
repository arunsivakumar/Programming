//
//  Zombie.swift
//  MonsterTown
//
//  Created by Lakshmi on 7/4/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


class Zombie:Monster{
    
//    var walksWithLimp = true
    var walksWithLimp:Bool
    private(set) var isFallingApart:Bool
    init(limp:Bool,fallingApart:Bool,town:Town?,monsterName:String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    final override func terrorizeTown() {
        if (town?.population)! > 10{
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
        
    }
}
