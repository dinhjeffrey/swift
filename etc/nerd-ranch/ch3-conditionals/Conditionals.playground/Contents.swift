//: Playground - noun: a place where people can play

import UIKit

var population: Int = 100000
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town"
} else if population >= 50000 && population < 100000 {
    message = "\(population) is a big town"
} else {
    message = "\(population) is very large"
}

print(message)


if !hasPostOffice {
    print("Go to the next town to buy post stamps")
}