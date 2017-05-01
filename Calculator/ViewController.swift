//
//  ViewController.swift
//  Calculator
//
//  Created by Jeremy on 28/04/2017.
//  Copyright © 2017 zerogmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    //存储属性
    var userIsInTheMiddleOfTyping = false
    
    //计算型属性
    var displayValue:Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private var brain = CalculatorBrain()

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        userIsInTheMiddleOfTyping = false
        if let digit = sender.currentTitle {
            brain.performOperation(digit)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
}

