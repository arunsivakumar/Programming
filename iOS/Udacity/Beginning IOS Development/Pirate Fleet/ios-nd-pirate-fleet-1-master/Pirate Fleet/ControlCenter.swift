//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine:_Mine_{
    let location:GridLocation
    let explosionText:String
}
class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        // Write your code here!
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0,y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 0, y: 2), isVertical: false)
        
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        let extraLargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
//        let mediumShip3 = Ship(length: 3, location: GridLocation(x: 0, y: 2), isVertical: false)
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(extraLargeShip1)
        
        let mine1 = Mine(location: GridLocation(x: 0, y:5),explosionText:"Hit by mine 1")
        let mine2 = Mine(location: GridLocation(x: 0, y:6 ),explosionText:"Hit by mine 2")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
    
//        human.addShipToGrid(mediumShip3)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = ((6 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus) + ((6-gameStats.humanShipsSunk) * gameStats.shipBonus) - ((gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty)
        print("the value of final score is \(finalScore)")
        return finalScore
    }
}