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
    var userPressedPeriod = false
    
    @IBAction private func tappedButton(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurentlyInDisplay = display.text!
            display.text = textCurentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    @IBAction func period(sender: UIButton) {
        let period = sender.currentTitle!
        if !userPressedPeriod && !userIsInTheMiddleOfTyping {
            display.text = period
            userPressedPeriod = true
            userIsInTheMiddleOfTyping = true
        }
        if !userPressedPeriod { // userIsInTheMiddleOfTyping is already true by default or else it would hit the previous if block
            let textCurentlyInDisplay = display.text!
            display.text = textCurentlyInDisplay + period
            userPressedPeriod = true
        }
    }
    
    /*
     computed property (vs stored property var)
     whenever we get the display, we get it returned as a Double
     we can also set it
     */
    
    private var displayValue: Double {
        get {
            print("in get")
            if display.text != "." {
                print("display.text! is \(display.text!)")
                return Double(display.text!)! // unwrapped because it might not be convertable (e.g. "hello")
            }
            return 0.0 // to capture for sqrt(.)
        }
        set {
            print("in set")
            display.text = String(newValue) // newValue is a special keyword. use (e.g. displayValue = M_PI vs. display.text = String(M_PI)
        }
    }
    
    /*
     the code to hook our model to controller
     */
    
    private var brain = CalculatorBrain()
    
    @IBAction private  func performOperation(sender: UIButton) {
        //if userIsInTheMiddleOfTyping { // don't need because default value is 0. if uncommented, CalculatorBrain default accumulator is 0.0 already. When just setting math symbols, it will use default accumulator value of 0.0
        brain.setOperand(displayValue)
        userPressedPeriod = false
        userIsInTheMiddleOfTyping = false
        //}
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

