//
//  Lifecycle.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 9/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest

class LifeCycle: XCTestCase {
    
    override class func setUp() {
        print("In class setUp.")
    }
    
    override class func tearDown() {
        print("In class tearDown.")
    }
    
    override func tearDown() {
        print("In tearDown.")
    }
    
    override func setUp() {
        print("In setUp.")
    }
    
    func testExample() {
        
        print("Starting test.")
        
        addTeardownBlock {
            print("In first tearDown block.")
        }
        
        print("In middle of test.")
        
        addTeardownBlock {
            print("In second tearDown block.")
        }
        print("Finishing test.")
    }
}
