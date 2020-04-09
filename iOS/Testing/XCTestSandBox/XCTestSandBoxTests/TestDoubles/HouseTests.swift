//
//  HouseTests.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class HouseTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {

    }

    func testExample() {

    }
    
    func DISABLE_testViewingHouseAddsOneToViewings() {
        // given
        let house = House()
        // when
        house.conductViewing()
        // then
        XCTAssertEqual(house.numberOfViewings, 1)
        
    }
    
    class HouseMock: HouseProtocol {
        var numberOfViewings = 0
        func conductViewing() {
            numberOfViewings += 1
        }
    }
    
    func testViewingHouseAddsOneToViewings() {
            
        // given
        let house = House()
        let startViewings = house.numberOfViewings
        
        // when
        house.conductViewing()
        
        // then
        XCTAssertEqual(house.numberOfViewings, startViewings + 1)
    }
    
    func testBuyerViewingHouseAddsOneToViewings() {
        
        // given
        let buyer = Buyer()
        let house = HouseMock()
        
        // when
        buyer.view(house)
        
        // then
        XCTAssertEqual(house.numberOfViewings, 1)
    }
}
