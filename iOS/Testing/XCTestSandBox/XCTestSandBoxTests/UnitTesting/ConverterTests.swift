//
//  ConverterTests.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 9/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class ConverterTests: XCTestCase {
    
    var sut: Converter!

    override func setUp() {
        
        sut = Converter()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       // continueAfterFailure = false
    }

    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func DISABLED_testFahrenheitToCelsius() {
        let sut = Converter()
        let input1 = 32.0
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        XCTAssertEqual(output1, 0)

        let input2 = 212.0
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        XCTAssertEqual(output2, 100)
    }
    
    func DISABLED2_testFahrenheitToCelsius() {

        // given
        let sut = Converter()
        let input1 = 32.0
        let input2 = 212.0

        // when
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        let output2 = sut.convertToCelsius(fahrenheit: input2)

        // then
        XCTAssertEqual(output1, 0)
        XCTAssertEqual(output2, 100)
    }

    func test32FahrenheitIsZeroCelsius() {
        // given
//        let sut = Converter()
        let input = 32.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        //XCTAssertEqual(celsius, 0)
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)

    }
    
    func test212FahrenheitIs100Celsius() {
        // given
//        let sut = Converter()
        let input = 212.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        //XCTAssertEqual(celsius, 100)
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)

    }
}
