//
//  Town.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

struct Town{
    let region: String //even though its let you can set value during init
    var population: Int {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStoplights: Int
    
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
    
    init(region: String, population: Int, stoplights: Int) {
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    
    init(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    enum Size {
        case small
        case medium
        case large
    }
    
    func printDescription(){
        print("Region: \(myTown.region), Population: \(myTown.population), Number of stop lights: \(myTown.numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int){
        population += amount
    }

}
