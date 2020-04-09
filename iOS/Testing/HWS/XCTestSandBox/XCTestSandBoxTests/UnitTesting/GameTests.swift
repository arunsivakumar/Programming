//
//  Game.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class GameTests: XCTestCase {

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

    func DISABLED_testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func DISABLED_testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        do {
            try game.play()
            XCTFail("BioBlitz has not been purchased.")
        } catch {

        }
    }
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased  {
            // success!
        } catch {
            XCTFail()
        }
    }
    
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        //XCTAssertThrowsError(try game.play())
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        try game.play()
    }
}
