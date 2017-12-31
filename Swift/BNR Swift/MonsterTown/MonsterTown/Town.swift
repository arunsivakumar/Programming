//
//  Town.swift
//  MonsterTown
//
//  Created by Lakshmi on 7/4/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


struct Town{
//    let region = "south" // default initialization all memberwise properties should have default values
//    var population = 5_422
//    var numberOfStoplights = 4
    
    let region:String
    var population:Int
    var numberOfStoplights:Int
    
    init(region:String,population:Int,stopLights:Int) {
        self.region = region
        self.population = population
        self.numberOfStoplights = stopLights
    }
    
    init(population:Int,stopLights:Int) { // init delegation
        self.init(region: "N/A", population: population, stopLights: stopLights)
    }
    
    enum Size{
        case small
        case medium
        case large
    }
    
//    lazy var townSize:Size = { // lazy takes a clouser computes only once
//        switch self.population{
//        case 0...10000:
//            return Size.small
//        case 10000...100001:
//            return Size.medium
//        default:
//            return Size.large
//            
//        }
//    }()
    
    var townSize:Size { // provide type
        get{
            switch self.population{
            case 0...10_000:
                return Size.small
            case 10_000...100_001:
                return Size.medium
            default:
                return Size.large
                
            }
        }
    }
    
    func description(){
        print("P:\(population), S:\(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount:Int){
        population += amount
    }
    
}
