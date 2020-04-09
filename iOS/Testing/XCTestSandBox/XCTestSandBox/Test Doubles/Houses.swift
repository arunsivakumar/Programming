//
//  Houses.swift
//  XCTestSandBox
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation
//
//class Buyer {
//    func view(_ house: House) {
//        house.conductViewing()
//    }
//}
//
//class House {
//    var numberOfViewings = 0
//    func conductViewing() {
//        numberOfViewings += 1
//    }
//}


protocol HouseProtocol {
   var numberOfViewings: Int { get set }
   func conductViewing()
}


class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

class House: HouseProtocol {
    var numberOfViewings = 0
    func conductViewing() {
        numberOfViewings += 1
    }
}


//protocol HouseProtocol {
//     func conductViewing()
//}
//
//
//class Buyer {
//    func view(_ house: HouseProtocol) {
//        house.conductViewing()
//    }
//}
//
//class House: HouseProtocol {
//    func conductViewing() {
//        print("the buyer looked")
//    }
//}
