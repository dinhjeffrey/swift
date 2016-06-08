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

final class CalculatorBrain { // no super class since CalculatorBrain is the base model
    var accumulator = 0.0
    var operand = 0.0
    var binaryOperatorSetOperandTracker = false // starts off false, setOperand->true, binaryOperator->false
    var isPartialResult = false
    var descriptionAccumulator = "0"
    var internalProgram = [AnyObject]()
    
    /*
     internalProgram is AnyObject and operand is a Double. How does it work?
     bridging in Objective C makes it work.
    */
    func setOperand(operand: Double) {
        self.operand = operand
        accumulator = operand
        print("in setOperand operand: \(self.operand), accumulator: \(accumulator)")
        descriptionAccumulator = String(format: "%g", operand)
        internalProgram.append(operand)
        print("internalProgram is \(internalProgram) and just appended \(operand)")
    }
    func setOperand(variableName: String) {}
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
    private let operations: [String: Operation] = [
        "π" : .Constant(M_PI),
        "e" : .Constant(M_E),
        "√" : .UnaryOperation(sqrt, {"√(\($0))"}),
        "sin" : .UnaryOperation(sin, {"sin(\($0))"}),
        "cos" : .UnaryOperation(cos, {"cos(\($0))"}),
        "tan" : .UnaryOperation(tan, {"tan(\($0))"}),
        "x!" : .UnaryOperation({tgamma($0+1)}, {"(\($0)!)"}),
        "log" : .UnaryOperation(log10, {"log_10(\($0))"}),
        "E" : Operation.BinaryOperation({$0*pow(10, $1)}, {"\($0) * 10 ^ \($1)"}),
        "xʸ" : Operation.BinaryOperation(pow, {"\($0) ^ \($1)"}),
        "×" : Operation.BinaryOperation(*, {"\($0) * \($1)"}),
        "÷" : Operation.BinaryOperation(/, {"\($0) ÷ \($1)"}),
        "+" : Operation.BinaryOperation(+, {"\($0) + \($1)"}),
        "−" : Operation.BinaryOperation(-, {"\($0) - \($1)"}),
        "=" : .Equals
    ]
    var variableValues: [String: Double] = [:]
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
    private enum Operation { // lower case in swift 3
        case Constant(Double)
        case UnaryOperation((Double) -> Double, (String) -> String)
        case BinaryOperation((Double, Double) -> Double, (String, String) -> String)
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
        internalProgram.append(symbol)
        print("internalProgram is \(internalProgram) and just appended \(symbol)")
        print("searching operations dictionary")
        if let operation = operations[symbol] {
            print("operation symbol is \(operation)")
            switch operation {
                
            case let .Constant(value):
                accumulator = value
                descriptionAccumulator = symbol
                print("in case .Constant")
                
            case let .UnaryOperation(function, descriptionFunction):
                accumulator = function(accumulator)
                descriptionAccumulator = descriptionFunction(descriptionAccumulator)
                print("in case .UnaryOperation")
                
            case let .BinaryOperation(function, descriptionFunction):
                print("in case .BinaryOperation")
                if binaryOperatorSetOperandTracker == true && pending != nil { /* clicking a digit sets binaryOperatorSetOperandTracker = true and clicking a binaryOperator sets it to = false */
                    print("in binarOperatorSetOperandTracker and intializing executePendingBinaryOperation and set new pending")
                    isPartialResult = true
                    executePendingBinaryOperation()
                    pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator, descriptionFunction: descriptionFunction, descriptionOperand: descriptionAccumulator)
                } else if pending != nil { /* goes here on second binary operation click */
                    print("in case .BinaryOperation != nil && isPartialResult")
                    pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator, descriptionFunction: descriptionFunction, descriptionOperand: descriptionAccumulator)
                } else { /* goes here on first binary operation click */
                    print("in case .BinaryOperation else and pending is \(pending)")
                    isPartialResult = true
                    pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator, descriptionFunction: descriptionFunction, descriptionOperand: descriptionAccumulator)
                }
                binaryOperatorSetOperandTracker = false
                print("set binaryOperatorSetOperandTracker = false")
                
            case .Equals:
                executePendingBinaryOperation()
                print("in case .Equals")
                
            }
        }
    }
    /*
     if we have a pending operation, then evaluate the expression
     pending!.binaryFunction is a call inside the Struct to the binaryFunction function with arguments of the firstOperand(salted away) and the current operand(accumulator)
     */
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            descriptionAccumulator = pending!.descriptionFunction(pending!.descriptionOperand, descriptionAccumulator)
            pending = nil
            isPartialResult = false
            print("in executePendingBinaryOperation. accumulator = \(accumulator) and descriptionAccumulator = \(descriptionAccumulator)")
        } else {
            print("in executePendingBinaryOperation else. pending is nil")
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
        private var binaryFunction: (Double, Double) -> Double
        private var firstOperand: Double
        private var descriptionFunction: (String, String) -> String
        private var descriptionOperand: String
    }
    /*
     Why make PropertyList?
     Because it tells that var program is of type AnyObject and is a PropertyList (documenting)
     You're return internal data structure to a public caller?
     But you're returning internalProgram which is an array. It is a copy, not the actual
     */
    typealias PropertyList = AnyObject
    var program: PropertyList {
        get {
            print("in program.get. return internalProgram which is \(internalProgram)")
            return internalProgram
        }
        set {
            print("in program.set. clear() now")
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOfOps {
                    if let localOperand = op as? Double {
                        print("in program.set op (\(op)) as? Double. setting operand setOperand(\(localOperand))")
                        setOperand(localOperand)
                    } else if let localOperation = op as? String {
                        print("in program.set op (\(op)) as? String. performing Operation performOperation(\(localOperation))")
                        performOperation(localOperation)
                    }
                }
            }
        }
    }
    private func clear() {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
        print("in clear(). wiped array internalProgram which is \(internalProgram)")
    }
    /*
     read only property since there is no set
     doesn't make sense for anyone to set the result
     */
    var result: Double { // don't need get if that is the only property
        print("in result get")
        return accumulator
    }
    private var description: String { // don't need get if that is the only property
        print("in description get")
        if pending == nil {
            return pending!.descriptionFunction(pending!.descriptionOperand, pending!.descriptionOperand != descriptionAccumulator ? descriptionAccumulator : "")
        } else {
            return descriptionAccumulator
        }
    }
}