//: Playground - noun: a place where people can play

import Foundation



if let firstNumber = Int("123") {
    if let secondNumber = Int("456") {
        if firstNumber < secondNumber {
            print("\(firstNumber) < \(secondNumber)")
        }
    }
}
// prints "123 < 456"

if let firstNumber = Int("123"), secondNumber = Int("456") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}
// prints "123 < 456"
 