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
    private var binaryOperatorsInArray = ["−", "+", "÷", "×", "E", "xʸ"]
    private var binaryOperatorToUnhighlight = UIButton?()
    private var lastAnswer = Double?()
    
    private var displayValue: String {
        get {
            print("in displayValue get")
            if display.text != "." {
                return display.text!
            }
            return "0" // to capture for sqrt(.)
        }
        set {
            print("in displayValue set")
            display.text = String(newValue) // newValue is a special keyword.
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
    func unhighlight(button: UIButton) {
        button.layer.borderWidth = 0
    }
    func highlight(button : UIButton) {
        let redBorder = UIColor( red: 0, green: 0, blue:0, alpha: 0.3 )
        button.layer.borderWidth = 4
        button.layer.borderColor = redBorder.CGColor
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
        if !userPressedPeriod {
            print("in func period !userPressedPeriod")
            displayValue += period
            userPressedPeriod = true
        }
        sequenceValue += String(period)
    }
    @IBAction func tappedRandomFrom0to1(sender: UIButton) {
        let random0to1 = drand48()
        sequenceValue = String(random0to1)
        displayValue = String(random0to1)
    }
    @IBAction func allClear(sender: UIButton) {
        displayValue = "0"
        sequenceValue = "0"
        print("in func allClear")
    }
    @IBAction func clearEntry(sender: UIButton) {
        let clearByOne = displayValue.endIndex.advancedBy(-1)
        sequenceValue = sequenceValue.substringToIndex(clearByOne)
        displayValue = displayValue.substringToIndex(clearByOne)
        if sequenceValue.characters.count == 0 {
            sequenceValue = "0"
        }
        if displayValue.characters.count == 0 {
            displayValue = "0"
        }
        print("in func clearEntry")
    }
    @IBAction func tappedAnsButton(sender: UIButton) {
        displayValue = String(lastAnswer!)
        print("in tappedAnsButton")
    }
    @IBAction private func tappedOperation(sender: UIButton) {
        print("in func tappedOperation")
        userPressedPeriod = false
        userIsInTheMiddleOfTyping = false
        print("sending displayValue to brain.setOperand")
        brain.setOperand(Double(displayValue)!)
        if let mathematicalSymbol = sender.currentTitle {
            // highlight
            if (binaryOperatorToUnhighlight != nil) {
                unhighlight(binaryOperatorToUnhighlight!)
            }
            if binaryOperatorsInArray.contains(mathematicalSymbol) {
                highlight(sender)
                binaryOperatorToUnhighlight = sender
            }
            // end:highlight
            print("in mathematicalSymbol. mathematicalSymbol is \(mathematicalSymbol). userPressedBinaryOperator is \(userPressedBinaryOperator) and sending mathematicalSymbol to brain.performOperation")
            brain.performOperation(mathematicalSymbol)
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
        lastAnswer = brain.result
        print("setting lastAnswer to brain.result")
    }
}

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
