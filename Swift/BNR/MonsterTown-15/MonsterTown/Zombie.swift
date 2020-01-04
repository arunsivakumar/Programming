//
//  Zombie.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation


class Zombie: Monster {
    var walksWithLimp = true
    
    override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
    }
}
