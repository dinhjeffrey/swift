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
    @IBOutlet private weak var sequence: UILabel!
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    private var userPressedPeriod = false
    private var userPressedBinaryOperator = false
    private var brain = CalculatorBrain()
    
    /*
     computed property (vs stored property var)
     whenever we get the display, we get it returned as a Double
     we can also set it
     */
    private var displayValue: String {
        get {
            print("in displayValue get")
            if display.text != "." {
                return display.text! // unwrapped because it might not be convertable (e.g. "hello")
            }
            return "0" // to capture for sqrt(.)
        }
        set {
            print("in displayValue set")
            display.text = String(newValue) // newValue is a special keyword. use (e.g. displayValue = M_PI vs. display.text = String(M_PI)
        }
    }
    private var sequenceValue: String {
        get {
            print("sequenceValue get")
            return sequence.text!
        }
        set {
            print("sequenceValue set")
            sequence.text = newValue
        }
    }
    
    @IBAction private func tappedButton(sender: UIButton) {
        let digit = sender.currentTitle!
        print("in tappedButton \(digit)")
        if userIsInTheMiddleOfTyping { // [CLEAN] if statements
            print("in userIsInMiddleOfTyping")
            displayValue += digit
            if !brain.isPartialResult {
                print("in userIsInMiddleOfTyping !brain.isPartialResult")
                sequenceValue += digit
            }
        } else {
            print("in userIsInMiddleOfTyping else")
            displayValue = digit
            if !brain.isPartialResult {
                print("in userIsInMiddleOfTyping else !brain.isPartialResult")
                sequenceValue = digit
            }
        }
        userIsInTheMiddleOfTyping = true
        
    }
    @IBAction func period(sender: UIButton) {
        print("in func period")
        let period = sender.currentTitle!
        if !userPressedPeriod && !userIsInTheMiddleOfTyping {
            print("in func period !userPressedPeriod && !userIsInTheMiddleOfTyping")
            displayValue = period
            userPressedPeriod = true
            userIsInTheMiddleOfTyping = true
        }
        if !userPressedPeriod { // userIsInTheMiddleOfTyping is already true by default or else it would hit the previous if block
            print("in func period !userPressedPeriod")
            displayValue += period
            userPressedPeriod = true
        }
        sequenceValue += String(period)
    }
    @IBAction func clearAll(sender: UIButton) {
        displayValue = "0"
        sequenceValue = "0"
        print("in func clearAll")
    }
    
    /*
     the code to hook our model to controller
     */
    @IBAction private func tappedOperation(sender: UIButton) {
        //if userIsInTheMiddleOfTyping { // don't need because default value is 0. if uncommented, CalculatorBrain default accumulator is 0.0 already. When just setting math symbols, it will use default accumulator value of 0.0
        print("in func tappedOperation")
        userPressedPeriod = false
        userIsInTheMiddleOfTyping = false
        print("sending displayValue to brain.setOperand")
        brain.setOperand(Double(displayValue)!)
        //}
        if let mathematicalSymbol = sender.currentTitle {
            print("in mathematicalSymbol. mathematicalSymbol is \(mathematicalSymbol). userPressedBinaryOperator is \(userPressedBinaryOperator)")
            //            guard !userPressedBinaryOperator else { return } // return if user did press binary op
            //            switch mathematicalSymbol {
            //            case "+": userPressedBinaryOperator = true
            //                brain.performOperation(mathematicalSymbol)
            //            case "-": userPressedBinaryOperator = true
            //                brain.performOperation(mathematicalSymbol)
            //            case "÷": userPressedBinaryOperator = true
            //                brain.performOperation(mathematicalSymbol)
            //            case "×": userPressedBinaryOperator = true
            //                brain.performOperation(mathematicalSymbol)
            //            default: brain.performOperation(mathematicalSymbol)
            //            }
//            if (mathematicalSymbol == "+" && !userPressedBinaryOperator) || (mathematicalSymbol == "−" && !userPressedBinaryOperator) || (mathematicalSymbol == "×" && !userPressedBinaryOperator) ||  (mathematicalSymbol == "÷" && !userPressedBinaryOperator) {
//                print("in mathematicalSymbol binaryOp && !userPressedBinaryOperator")
//                userPressedBinaryOperator = true
//                print("sending '\(mathematicalSymbol)' to brain.performOperation")
//                brain.performOperation(mathematicalSymbol)
//            } else if userPressedBinaryOperator && mathematicalSymbol != "=" {
//                print("in mathematicalSymbol binaryOp && mathematicalSymbol != =")
//                return
//            } else { // user pressed an unary operator or "="
//                print("in mathematicalSymbol else")
                brain.performOperation(mathematicalSymbol)
//            }
            /*
             guard let title = button.currentitle, operation = operations[title] else {
             return
             }
             if case .binary(let method) = operation {
             print(method(3,2))
             }
             else if .unary(let method) = operation {
             print(method(3))
             }
             */
            print("mathematicalSymbol is \(mathematicalSymbol)")
            sequenceValue += mathematicalSymbol
            print("brain.isPartialResult is \(brain.isPartialResult) and !brain.isPartialResult is \(!brain.isPartialResult)")
            if brain.isPartialResult {
                sequenceValue += "..."
                print("in mathematicalSymbol brain.isPartial")
            }
            if brain.isPartialResult && mathematicalSymbol == "=" {
                print("in mathematicalSymbol brain.isPartial else and sequenceValue is \(sequenceValue)")
                let noPeriods = sequenceValue.endIndex.advancedBy(-4) // [BUG] when you press
                sequenceValue = sequenceValue.substringToIndex(noPeriods) + String(brain.operand) + "="
            }
        }
        print("sending brain.result to displayValue")
        displayValue = String(brain.result)
    }
}

