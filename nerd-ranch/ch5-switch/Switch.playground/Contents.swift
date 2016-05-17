//: Playground - noun: a place where people can play

import UIKit

let a = 5
switch a { // Swift does not require breaks in switch statements. It automatically stops when matching a case.
    case 5: print("A IS 5")
    fallthrough // fallthrough tells the switch statement to go to the next immediate switch case and execute without having to match it
    case 7: print("A IS 7")
    default: print("ONE PUNCH MAN ROX")
}

STOP ON PAGE 39