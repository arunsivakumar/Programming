//
//  ShareViewTests.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class ShareViewControllerTests: XCTestCase {
    
    class ShareViewModelMock: SharePresenter {
        let title = "Share"
        var count = 0
        var isShareClicked = false
        func shareToInstagram() {
            isShareClicked = true
            count += 1
        }
    }

    var presenter: ShareViewModelMock!
    
    override func setUp() {
        presenter = ShareViewModelMock()
    }

    override func tearDown() {
        presenter = nil
    }

    func testOnShareToInstagramOnPesenter() {
        let sut = makeSUT()
        sut.presenter = presenter
        XCTAssertTrue(presenter.isShareClicked)
    }
    
    func testOnShareToInstagramClickedTwice() {
        let sut = makeSUT()
        sut.presenter = presenter
        XCTAssertEqual(presenter.count, 2)
    }
    
    func testRender() {
        let sut = makeSUT()
        sut.presenter = presenter
        XCTAssertEqual(sut.headerLabel.text, "Share")
    }
    
    func testConnection() {
        let sut = makeSUT()
        sut.presenter = presenter
        XCTAssertNotNil(sut.customView)
    }
    
    func makeSUT() -> ShareViewController {
        let sut = ShareViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
