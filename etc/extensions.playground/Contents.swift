//: Playground - noun: a place where people can play

import Foundation
import UIKit

extension String {
    var asArray: [Character] {
        var result = [Character]()
        
        for char in self.characters {
            result.append(char)
        }
        return result
    }
    
    func letterOccurrence(theChar: Character) -> Int {
        var numOfChars = 0
        
        for letter in self.characters {
            if letter == theChar {
                numOfChars += 1
            }
        }
        return numOfChars
    }
}

var characters = "A random string".asArray

print(characters)



var numberOfAs: Int = "a random string".letterOccurrence("a")
print(numberOfAs)


