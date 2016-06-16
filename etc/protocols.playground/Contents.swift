//: Playground - noun: a place where people can play

import UIKit

protocol Flyable {
    var flies: Bool {get set}
    
    func fly(distMiles: Double) -> String
}

class Vehicle: Flyable {
    var flies: Bool = false
    var name: String = "No Name"
    
    func fly(distMiles: Double) -> String {
        if(self.flies) {
            return "\(self.name) flies \(distMiles) miles"
        } else {
            return "\(self.name) can't fly"
        }
    }
}

var fordF150 = Vehicle()

fordF150.name = "Ford F-150"
fordF150.flies = false
print(fordF150.fly(150))