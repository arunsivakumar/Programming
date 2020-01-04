//
//  Town.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

struct Town{
    
    var population = 5_422
    var numberOfStoplights = 4
    
    func printDescription(){
        print("Population: \(myTown.population), number of stop lights: \(myTown.numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int){
        population += amount
    }

}
