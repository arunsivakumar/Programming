//
//  Tweet.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

//struct Tweet {
//    var text: String
//    var author: String
//    var date: Date
//    init(text: String, author: String) {
//        self.text = text
//        self.author = author
//        self.date = Date()
//    }
//}

struct Tweet {
    let text: String
    let author: String
    let date: Date
    init(text: String, author: String, date: Date = Date()) {
        self.text = text
        self.author = author
        self.date = date
    }
}
