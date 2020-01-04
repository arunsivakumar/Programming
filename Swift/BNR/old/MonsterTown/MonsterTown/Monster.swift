//
//  Monster.swift
//  MonsterTown
//
//  Created by Lakshmi on 7/4/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


class Monster{
    var town:Town?
//    var name = "Monster"
    var name:String
    
    
    // read/write computed property
    var victimPool:Int{
        get{
         return town?.population ?? 0
        }
        
        set(newVictimPool){
            town?.population = newVictimPool
        }
    }
    
    init(town:Town?,monsterName:String) {
        self.town = town
        self.name = monsterName
    }
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasnt found a town yet")
        }
    }
}

// Type properties, controlling getter and setter visibility
