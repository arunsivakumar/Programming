//
//  AppTests.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class AppTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testUserCantBuyUnreleasedApp() {
        struct UnreleasedAppStub: AppProtocol {
            var price: Decimal = 0
            var minimumAge = 0
            var isReleased = false
            func canBePurchased(by user: UserProtocol) -> Bool {
                return false
            }
        }
        // given
        var sut = User(funds: 100, age: 21, apps: [])
        let app = UnreleasedAppStub()
        // when
        let wasBought = sut.buy(app)
        // then
        XCTAssertFalse(wasBought)
    }
}
