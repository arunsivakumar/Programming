//
//  Accountant.swift
//  ARC
//
//  Created by Lakshmi on 1/14/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation


class Accountant {
    typealias NetWorthChanged = (Double) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gained(_ asset: Asset,completion: () -> Void) {
        netWorth += asset.value
        completion() //non- escaping
    }
}
