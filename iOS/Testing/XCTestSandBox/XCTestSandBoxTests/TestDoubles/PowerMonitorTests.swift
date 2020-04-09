//
//  PowerMonitorTests.swift
//  XCTestSandBoxTests
//
//  Created by Arun Sivakumar on 7/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import XCTest
@testable import XCTestSandBox

class PowerMonitorTests: XCTestCase {

    override func setUp() {
    
    }

    override func tearDown() {
 
    }
    
//    class UnpluggedDeviceMock: UIDevice {
//       override var batteryState: BatteryState {
//            return .unplugged
//        }
//    }
//
//    class UnknownDeviceMock: UIDevice {
//       override var batteryState: BatteryState {
//            return .unknown
//       }
//    }
//
//    class ChargingDeviceMock: UIDevice {
//        override var batteryState: BatteryState {
//            return .charging
//        }
//    }
    
//    class DeviceMock: UIDevice {
//        var testBatteryState: BatteryState
//        init(testBatteryState: BatteryState) {
//            self.testBatteryState = testBatteryState
//            super.init()
//        }
//
//        override var batteryState: BatteryState {
//            return testBatteryState
//        }
//    }
    
    struct DeviceMock: DeviceProtocol {
        var testBatteryState: UIDevice.BatteryState
        var batteryState: UIDevice.BatteryState {
            return testBatteryState
        }
    }
    
    
    func testUnpluggedDeviceShowsDown() {
        // given
        let sut = PowerMonitor(device: DeviceMock(testBatteryState: .unplugged))
        // when
        let message = sut.getStatus()
        // then
        XCTAssertEqual(message, "Power is down")
    }
}
