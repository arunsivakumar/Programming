//
//  Monster.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

class Monster{
    
    var town: Town?
    var name: String
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    required init(town: Town?, monsterName: String){
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
