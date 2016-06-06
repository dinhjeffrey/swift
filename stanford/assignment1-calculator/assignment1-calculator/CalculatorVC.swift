//
//  ViewController.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 5/26/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

/******************************************************
 ******************************************************
 ******************************************************
 
                        TODO:
 * don't need arguments for some actions such as Ans button
 
 ******************************************************
 ******************************************************
 ******************************************************/

import UIKit
import Foundation

class CalculatorVC: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    @IBOutlet private weak var sequenceLabel: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    private var userPressedBinaryOperator = false
    private lazy var brain = CalculatorBrain()
    private let binaryOperatorsInArray = ["−", "+", "÷", "×", "E", "xʸ"]
    private let unaryOperatorsInArray = ["√", "sin", "cos", "tan", "x!", "log"]
    private let constantsInArray = ["π", "e"]
    private var binaryOperatorToUnhighlight = UIButton?()
    private var lastAnswer = Double(0)
    private var currentDigit = String?()
    
    private var displayValue: String {
        get {
            print("in displayValue get")
            return display.text!   // ?? "0" // default operator
        }
        set {
            print("in displayValue set")
            display.text = newValue // newValue is a special keyword.
        }
    }
    private func unhighlight(button: UIButton) {
        print("in unhighlight()")
        button.layer.borderWidth = 0
    }
    private func highlight(button : UIButton) {
        print("in highlight()")
        let redBorder = UIColor( red: 0, green: 0, blue:0, alpha: 1.0 )
        button.layer.borderWidth = 5
        button.layer.borderColor = redBorder.CGColor
    }
    
    @IBAction private func tappedButton(sender: UIButton) {
        let digit = sender.currentTitle!
        print("sending to sequencePressedADigit(\(digit))")
        sequencePressedADigit(digit)
        print("in tappedButton \(digit)")
        currentDigit = digit
        if userIsInTheMiddleOfTyping { // [CLEAN] if statements
            print("in userIsInMiddleOfTyping")
            displayValue += digit
        } else {
            print("in userIsInMiddleOfTyping else")
            displayValue = digit
        }
        userIsInTheMiddleOfTyping = true
        brain.binaryOperatorSetOperandTracker = true
        print("set binaryOperatorSetOperandTracker = true")
    }
    @IBAction private func period() {
        print("in func period")
        if !displayValue.characters.contains(".") {
            displayValue += "."
            print("sending to sequencePeriod('.')")
            sequencePeriod(".")
        }
    }
    @IBAction private func tappedRandomFrom0to1() {
        print("in tappedRandomFrom0to1")
        let random0to1 = drand48()
        displayValue = String(random0to1)
        print("sending to sequenceRandom0to1(\(random0to1))")
        sequenceRandom0to1(String(random0to1))
    }
    @IBAction private func allClear() {
        print("in func allClear")
        displayValue = "0"
        brain.accumulator = 0
        brain.operand = 0
        userIsInTheMiddleOfTyping = false
        brain.pending = nil
        if let binaryOperatorToUnhighlight = binaryOperatorToUnhighlight {
            unhighlight(binaryOperatorToUnhighlight)
        }
        print("sending to sequenceAllClear()")
        sequenceAllClear()
    }
    @IBAction private func clearEntry() {
        let clearByOne = displayValue.endIndex.advancedBy(-1)
        displayValue = displayValue.substringToIndex(clearByOne)
        if displayValue.characters.count == 0 {
            displayValue = "0"
        }
        print("in func clearEntry")
    }
    @IBAction private func tappedAnsButton() {
        displayValue = String(lastAnswer)
        print("in tappedAnsButton")
        print("sending to sequenceAnswer()")
        sequenceAnswer()
    }
    
    
    private var savedProgram: CalculatorBrain.PropertyList?
    @IBAction private func save() {
        savedProgram = brain.program
        print("stored brain.program which is \(brain.program) to savedProgram")
    }
    @IBAction private func restore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = String(brain.result)
        } else {
            displayValue = "0"
        }
        if let binaryOperatorToUnhighlight = binaryOperatorToUnhighlight {
            unhighlight(binaryOperatorToUnhighlight)
        }
        sequenceValue = brain.descriptionAccumulator + " ="
    }
    
    
    @IBAction private func tappedOperation(sender: UIButton) {
        print("in func tappedOperation")
        userIsInTheMiddleOfTyping = false
        print("sending displayValue to brain.setOperand")
        brain.setOperand(Double(displayValue)!)
        if let mathematicalSymbol = sender.currentTitle {
            // highlight
            if (binaryOperatorToUnhighlight != nil && !unaryOperatorsInArray.contains(mathematicalSymbol)) &&
                (binaryOperatorToUnhighlight != nil && !constantsInArray.contains(mathematicalSymbol)) {
                print("initializing unhighlight()")
                unhighlight(binaryOperatorToUnhighlight!)
            }
            if binaryOperatorsInArray.contains(mathematicalSymbol) {
                print("initializing highlight() and setting binaryOperatorToUnhighlight to UIButton sender: \(sender.currentTitle)")
                highlight(sender)
                binaryOperatorToUnhighlight = sender
            }
            // end:highlight
            print("in mathematicalSymbol. mathematicalSymbol is \(mathematicalSymbol). userPressedBinaryOperator is \(userPressedBinaryOperator) and sending mathematicalSymbol to brain.performOperation")
            brain.performOperation(mathematicalSymbol)
            print("brain.isPartialResult is \(brain.isPartialResult)")
            print("sending to sequencePressedAnOperator(\(mathematicalSymbol))")
            sequencePressedAnOperator(mathematicalSymbol)
        }
        print("sending brain.result to displayValue")
        displayValue = String(brain.result)
        lastAnswer = brain.result
        print("setting lastAnswer to brain.result")
    }
}

/**** sequenceLabel ****/
private extension CalculatorVC {
    var sequenceValue: String {
        get {
            print("in sequenceValue.get")
            return sequenceLabel.text!
        }
        set {
            print("in sequenceValue.set")
            sequenceLabel.text = newValue
        }
    }
    func sequencePeriod(period: String) {
        print("in sequencePeriod")
        sequenceValue += period
    }
    func sequenceRandom0to1(randomNumber: String) {
        print("in sequenceRandom0to1")
        sequenceValue += randomNumber
    }
    func sequenceAllClear() {
        print("in sequenceAllClear")
        sequenceValue = " "
    }
    func sequenceClearEntry() {}
    func sequenceAnswer() {
        print("in sequenceAnswer")
        sequenceValue += String(lastAnswer)
    }
    func sequencePressedADigit(digit: String) {
        print("in sequencePressedADigit")
        if !brain.isPartialResult {
            sequenceValue += digit
        }
    }
    func sequencePressedAnOperator(mathematicalSymbol: String) {
        print("in sequencePressedAnOperator")
        if brain.isPartialResult {
            sequenceValue += mathematicalSymbol + "..."
        } else {
            sequenceValue = brain.descriptionAccumulator + " ="
        }
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