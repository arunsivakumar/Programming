//
//  Converter.swift
//  Converter
//
//  Created by Arun Sivakumar on 6/4/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        //return (fahrenheit - 32) * 5 / 9
        let fahrenheit = Measurement(value: fahrenheit, unit:
        UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
         return celsius.value
    }
}
