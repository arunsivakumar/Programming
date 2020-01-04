//
//  Monster.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

class Monster{
    
    static let isTerrifying = true // static properties on type level
    
    class var spookyNoise: String {
        return "Brains..."
    }
    
    var town: Town?
    var name = "Monster"
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
