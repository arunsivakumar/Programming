//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Lakshmi on 11/5/16.
//  Copyright © 2016 Lakshmicom.arunsivakumar. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController,UITextFieldDelegate {
    
    var ​f​a​h​r​e​n​h​e​i​t​V​a​l​u​e​:Double?{didSet{updateCelsiusLabel()}} // property observer

    var celciusValue:Double?{ // computed property
        get{
            if let value = ​f​a​h​r​e​n​h​e​i​t​V​a​l​u​e​{
                return (value - 32) * (5/9)
            }else{
                return nil
            }
        }
    }
    
    let numberFormatter:NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField){
//        if let text = textField.text where !text.isEmpty{
//        celciusLabel.text = textField.text
//        }else{
//             celciusLabel.text = "???"
//        }
        
        if let text = textField.text, value = Double(text){
           ​f​a​h​r​e​n​h​e​i​t​V​a​l​u​e​ = value
        }else{
            ​f​a​h​r​e​n​h​e​i​t​V​a​l​u​e​ = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender:AnyObject){
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    func updateCelsiusLabel(){
        if let value = celciusValue{
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }else{
            celciusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
      let existingTextHasDecimalSeperator = textField.text?.rangeOfString(".")
        let replacementStringHasDecimal = string.rangeOfString(".")
        
        if existingTextHasDecimalSeperator != nil && replacementStringHasDecimal != nil{
            return false
        }
        return true
    }
    

}

