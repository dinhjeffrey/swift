 //: Playground - noun: a place where people can play

import UIKit

var myFirstInt: Int = 0

 for i in 1...5 {
    myFirstInt += 2
    print("myFirstInt is \(myFirstInt) at iteration \(i)")
 }
 
 for case let i in 1...100 where i % 3 == 0 { // case let i lets you create a local constant i. looks at if i is a multiple of 3 first, then checks if i is in the range of 1 to 100
    print(i)
 }
 
 // repeat-while loop
 
// var shields: Int = 2
 
// repeat {
//    print("Fire mah lazer!")
//    shields -= 1
// } while shields > 0
 
 // continue - jumps back to the beginning of the loop, wherever called
 var shields = 5
 var blastersOverheating = false
 var blasterFireCount = 0
 var spaceDemonsDestroyed = 0
// while shields > 0 {
//    if spaceDemonsDestroyed == 500 {
//        print("You beat the game!")
//        break
//    }
//    if blastersOverheating {
//        print("Blasters are overheated! Cooldown initiated.")
//        sleep(5)
//        print("Blasters ready to fire")
//        sleep(1)
//        blastersOverheating = false
//        blasterFireCount = 0
//        continue
//    }
//    if blasterFireCount > 100 {
//        blastersOverheating = true
//        continue
//    }
//    // Fire blasters!
//    print("Fire blasters!")
//    blasterFireCount += 1
//    spaceDemonsDestroyed += 1
// }
 var count = 0
 for case let j in 0...100 where j%2 == 0 {
    count += 1
    if count >= 5 {
        "Ran at least 5 times"
    }
    print(j)
 }
 