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
    var name = "Monster"
    
    func terrorizeTown(){
        if town != nil{
            print("\(name) is terrorizing a town!")
        }else{
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
