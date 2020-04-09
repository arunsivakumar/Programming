//
//  PrimeCalculatorTest.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class PrimeCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func DISABLED_testPrimesUpTo100ShouldBe0() {
        // given
        let maximumCount = 100
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 0)
        }
    }

    
    func testPrimesUpTo100ShouldBe0() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
