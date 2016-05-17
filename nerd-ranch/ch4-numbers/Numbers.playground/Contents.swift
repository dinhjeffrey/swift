//: Playground - noun: a place where people can play

import UIKit

print("The minimum number in Swift is \(Int.min)")

print("The maximum number in Swift is \(Int.max)")
print("The minimum number for a 32-bit integer in Swift is \(Int32.min)")

print("The maximum number for a 32-bit integer in Swift is \(Int32.max)")
print("The minimum unsigned 64-bit integer in Swift is \(UInt.min)")

print("The maximum unsigned 64-bit integer in Swift is \(UInt.max)")
print(555*32)
print(11/3)
print(-11/3)
print(-11%3)
var randomNumber = 44
randomNumber+=1
print(randomNumber)
print("maximum Int8 integer is \(Int8.max)")
let y: Int8 = 123
let z = y&+11

let a: Double = 1.2
let b = 1.2

print(a==b)

print("a + 0/1 is \(a + 0.1)")
if a + 0.1 == 1.3 {
    print("a + 0.1 is equal to 1.3") // supposed to not equal? because value stored in float is an exactly accurate. So there may be some potential pitfalls
}





