//
//  Game.swift
//  XCTestSandBox
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

enum GameError: LocalizedError {
   case notPurchased
   case notInstalled
   case parentalControlsDisallowed
}

struct Game {
    
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}


extension LocalizedError {
   var errorDescription: String? {
    return "\(self)" }
}
