//
//  ViewController.swift
//  new-calc
//
//  Created by jeffrey dinh on 6/14/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
// 



// correct description

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var display: UILabel!
    @IBOutlet private weak var history: UILabel!
    
    private var operandStack = [Double]() // ?????????
    private var userIsInTheMiddleOfTypingANumber = false
    private let defaultDisplayText = "0"
    private func appendHistory(value: String) { //???????
        // remove the last " = "
        if (value != "=") && (history.text!.rangeOfString("=") != nil) {
            history.text = history.text!.stringByReplacingOccurrencesOfString("=", withString: "")
        }
        history.text = history.text! + value
    }
    private func performOperation(operation: Double -> Double) { // unaryOp
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    private func performOperation(operation: (Double, Double) -> Double) { // binaryOp
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    private func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if displayValue != nil {
            operandStack.append(displayValue!)
            print("operandStack = \(operandStack)")
        }
    }
    private var displayValue: Double? {
        get {
            if let displayValue = NSNumberFormatter().numberFromString (display.text!) { //???
                return displayValue.doubleValue
            } else {
                return nil
            }
        }
        set {
            if newValue != nil {
                display.text = String(newValue!)
            } else {
                display.text = defaultDisplayText
            }
        }
    }
    
    
    @IBAction private func clear() {
        operandStack = [Double]()
        userIsInTheMiddleOfTypingANumber = false
        display.text = defaultDisplayText
        history.text = " "
    }
    @IBAction private func backspace(sender: UIButton) {
        appendHistory("\(sender.currentTitle!)")
        if display.text!.characters.count > 1 {
            display.text = String(display.text!.characters.dropLast())
        } else {
            userIsInTheMiddleOfTypingANumber = false
            display.text = defaultDisplayText
        }
    }
    @IBAction private func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            if digit != "." || display.text!.rangeOfString(".") == nil {
                display.text = display.text! + digit
            }
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    @IBAction private func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            appendHistory(display.text!)
            enter()
        }
        appendHistory(operation)
        appendHistory("=")
        switch operation {
        case "×": performOperation {$1 * $0}
        case "÷": performOperation {$1 / $0}
        case "x": performOperation {$1 * $0}
        case "+": performOperation {$1 + $0}
        case "−": performOperation {$1 - $0}
        case "√": performOperation { sqrt($0) }
        case "sin": performOperation { sin($0) }
        case "cos": performOperation { cos($0) }
        case "π": displayValue = M_PI; enter()
        default: break
        }
    }
    @IBAction func enter(sender: UIButton) {
        appendHistory(display.text!)
        appendHistory("↵")
        enter()
    }
    
    
    
    
}

