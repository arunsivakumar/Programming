//
//  Testing_BasicsTests.swift
//  Testing-BasicsTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import Testing_Basics // @testable attribute automatically gives your tests the same access to code - to fetch internal

class Testing_BasicsTests: XCTestCase {
 // class variants class func setUp()/tearDown()
    
    var a = 5
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHaterStartsNicely() {
        a = 6
        print("value:--- \(a)")
        let hater = Hater()
        XCTAssertFalse(hater.hating)
       
    }
    
    func testHaterHatesAfterBadDay() {
        a = 7
        print("value:--- \(a)")
        var hater = Hater()
        hater.hadABadDay()
        XCTAssertTrue(hater.hating)
        
    }
    
    func testHaterHappyAfterGoodDay() {
        print("value:--- \(a)")
        var hater = Hater()
        hater.hadAGoodDay()
        XCTAssertFalse(hater.hating)
    }
}

// cmd + U
// Life cycle
//class func setUp()
//setUp()
//testHaterHatesAfterBadDay()
//tearDown()
//setUp()
//testHaterHatesAfterGoodDay()
//tearDown()
//setUp()
//testHaterStartsNicely()
//tearDown()
//class func tearDown()

// 1. Runs in different order
//ans: alphabetical order
// 2. why setup when we can create properties
//ans: come back ?????

//1. Their names all start with the word “test”.
//2. They all accept no parameters.
//3. They all return nothing.

// DISABLED_
//testMeaningOfLifeShouldBe42()
//[UnitOfWork_StateUnderTest_ExpectedBehavior]


 //XCTAssertTrue(2 == 3) XCTAssertEqual(2, 3)
// The first one will print XCTAssertTrue failed, whereas the second will print XCTAssertEqual failed: ("2") is not equal to (“3”)

//1. You’re putting things into place ready for the test.
//2. You’re executing the code you want to test.
//3. You’re evaluating the results of that test.

 //https://pragprog.com/magazines/2012-01/unit-tests-are-first.


// Fast: you should be able to run dozens of them every second, if not hundreds. As they say in the article, “the faster your tests run, the more often you’ll run them.”
//• Isolated: they should not depend on another test having run, or any sort of external state.
//• Repeatable: they should always give the same result when they are run, regardless of how
//many times or when they are run. If unit tests intermittently fail – usually called “flaky
//tests” – developers stop trusting them as being an accurate measure of code health.
//• Self-verifying: the test must unambiguously say whether it passed or failed, with no room
//for interpretation.
//• Timely: they should be written before or alongside the production code that you are testing.
//This leads into test-driven development, which is covered much later in this book.

//Chris Eidhof: “Types are not a silver bullet. You still need to test your code. But wouldn’t you rather test interesting parts, and leave the boring stuff to the compiler?”

//At WWDC17, Xcode engineer Greg Tracy said “Treat your test code with the same amount of care as your app code.”
