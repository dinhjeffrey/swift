//
//  ViewController.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 5/26/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     all of our methods in our ViewController and CalculatorBrain is public
     BUT we don't want that because we dont want a func in our model to call a func in our controller
     use private keyword
     Generated Interface gives API
     */
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func tappedButton(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurentlyInDisplay = display.text!
            display.text = textCurentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        print("\(digit) was pressed")
    }
    
    /*
     computed property (vs stored property var)
     whenever we get the display, we get it returned as a Double
     we can also set it
     */
    
    private var displayValue: Double {
        get {
            return Double(display.text!)! // unwrapped because it might not be convertable (e.g. "hello")
        }
        set {
            display.text = String(newValue) // newValue is a special keyword. use (e.g. displayValue = M_PI vs. display.text = String(M_PI)
        }
    }
    
    /*
     the code to hook our model to controller
     */
    
    private var brain = CalculatorBrain()
    
    @IBAction private  func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

