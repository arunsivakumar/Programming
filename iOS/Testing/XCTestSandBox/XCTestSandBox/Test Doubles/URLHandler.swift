//
//  URLHandler.swift
//  XCTestSandBox
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation
import UIKit

//struct URLHandler {
//    func open(url: URL) {
//        if url.absoluteString.hasPrefix("internal://") { // run some app-specific code
//        } else {
//            UIApplication.shared.open(url, options: [:],
//                                      completionHandler: nil)
//        }
//    }
//}


//struct URLHandler {
//    let application: ApplicationProtocol
//
//    func open(url: URL) {
//        if url.absoluteString.hasPrefix("internal://") { // run some app-specific code
//        } else {
//            UIApplication.shared.open(url, options: [:],
//                                      completionHandler: nil)
//        }
//    }
//}
//
//protocol ApplicationProtocol {
//    func open(_ url: URL,
//              options: [UIApplication.OpenExternalURLOptionsKey: Any],
//             completionHandler completion: ((Bool) -> Void)?)
//}
//
//extension UIApplication: ApplicationProtocol { }


typealias URLOpening = (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void


struct URLHandler {
    
    let urlOpener: URLOpening = UIApplication.shared.open
    
    func open(url: URL) {
        if url.absoluteString.hasPrefix("internal://") {
            // run some app-specific code
        } else {
            urlOpener(url, [:], nil)
        }
    }
}
