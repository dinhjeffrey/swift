//
//  CalculatorBrain.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 5/26/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

/*
 how can we use CalculatorBrain model over in ViewController?
 need a link for controller to talk to model
 by creating a var keyword that initializes CalculatorBrain
 everytime you create a new class, you have 1 free initializer that takes no arguments
 now you can use CalculatorBrain's API
 */

import Foundation // models are UI independent so it never imports UIKit. Nothing in here about UI, all calculations

class CalculatorBrain { // no super class since CalculatorBrain is the base model
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    /*
     π is `option + p`
     factored out func performOperation into operations dictionary because a lot of the code will be duplicated code
     how do we get pi or a function from our enums? Associated Values (Put in the parameters, arguments)
     for the binaryOperations, it will not be elegant if we have separate functions for each, but Swift takes care of this via closures
     closures are inline functions that captures the state of its environment
     eg Operation.BinaryOperation( { (op1: Double, op2: Double) -> Double in 
        return op1 * op2
        })
     make this look a lot better with type inference
     $0, $1, $2 .. are default arguments
     */
    var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({ $0 * $1}),
        "÷" : Operation.BinaryOperation({ $0 / $1}),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "−" : Operation.BinaryOperation({ $0 - $1}),
        "=" : Operation.Equals
    ]
    /*
     enums is a discrete set of values
     enums like classes can have methods. enums cannot have vars or inheritance.
     enums like struct are passby values, copied (but not everything) instead of pointers like functions
     not all keys in operation is not a Double, we have some functions like sqrt.
     therefore we use enum to let us use different values like Double, functions, etc.
     an Optional is actually an enum:
        enum Optional<T> {
            case None
            case Some<T>
        }
     */
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    /*
     // syntax on how to look up things in dictionary. operation may not contain key we are looking for so we unwrap it via if let operation = ... Use `if let` instead of `!` because `!` can crash app when user does an operation we don't know. `if let` ignores any operations we don't understand
     how do we look things up from operations dictionary?
     using `if let operation =`, operation is now one of the enums, the value in the dictionary
     swift knows let operation is enum Operation so we can juse use .Constant, etc.
     how do we get that associated value out from the enum? (let value): accumulator = value
     Switch statement is powerful because it does these pattern matching to get the associated values out
     BinaryOperations you need 2 values before you can execute the function, so you have to salt it away
     We salt it away in another data structure called Struct
     */
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals: executePendingBinaryOperation()
            }
        }
    }
    /*
     if we have a pending operation, then evaluate the expression
     pending!.binaryFunction is a call inside the Struct to the binaryFunction function with arguments of the firstOperand(salted away) and the current operand(accumulator)
     */
    func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    /*
     why are we making pending an optional?
     because when we type a number and not the operation yet, we want that operation to be nil and when we have one, we set it to that
     
    */
    var pending: PendingBinaryOperationInfo?
    
    /*
     What is a struct?
     Struct is almost identical to class. It can have stored and computed vars. No inheritance. Big difference is that Struct and Enums are copied (passed by value, but not entirely bc Swift optimizes it!), not via pointers (aka pass by reference) like class
     Classes we get a free initializer (nothing passed)
     We initialize Structs by passing in the argument every vars defined in the Struct
     when we click `5 *`, when we hit `*`, we store `5` into firstOperand.
    */
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    /*
     read only property since there is no set
     doesn't make sense for anyone to set the result
     */
    var result: Double {
        get {
            return accumulator
        }
    }
    
}
