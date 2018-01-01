//
//  ViewController.swift
//  Calculator
//
//  Created by Arun Sivakumar on 7/2/16.
//  Copyright © 2016 Arun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        //        print("touched \(digit) digit")
    }
    
    private var displayValue :Double{
        get{
            return Double(display.text!)!
        }set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping =  false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            //            if mathematicalSymbol == "π"{
            //                displayValue = M_PI
            ////             display.text =  String(M_PI) //M_PI
            //            }else if mathematicalSymbol == "√"{
            //                 displayValue = sqrt(displayValue)
            //            }
            brain.performOperation(mathematicalSymbol)
            displayValue = brain.result
        }
    }
}

