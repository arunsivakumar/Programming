//
//  Town.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

struct Town{
    static let region = "South" // needs value
    var population = 5_422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStoplights = 4
    
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
    
    enum Size {
        case small
        case medium
        case large
    }
    
    func printDescription(){
        print("Population: \(myTown.population), number of stop lights: \(myTown.numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int){
        population += amount
    }

}
