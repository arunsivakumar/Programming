//
//  PowerMonitor.swift
//  XCTestSandBox
//
//  Created by Arun Sivakumar on 7/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

//struct PowerMonitor {
//
//    var device: UIDevice
//
//    func getStatus() -> String {
//        if device.batteryState == .unplugged {
//            return "Power is down"
//        } else if device.batteryState == .unknown {
//            return "Error"
//        } else {
//            return "Power is up"
//        }
//    }
//}



struct PowerMonitor {
    
    var device: DeviceProtocol
    
    func getStatus() -> String {
        if device.batteryState == .unplugged {
            return "Power is down"
        } else if device.batteryState == .unknown {
            return "Error"
        } else {
            return "Power is up"
        }
    }
}

protocol DeviceProtocol {
    var batteryState: UIDevice.BatteryState { get }
}

extension UIDevice: DeviceProtocol { }
