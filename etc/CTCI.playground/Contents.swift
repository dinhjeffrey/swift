//: CRACKING THE CODING INTERVIEW

import Foundation


// 1.1
func uniqueChars(str: String) -> Bool {
    var arr = [Character]()
    for i in str.characters.indices {
        if arr.indexOf(str[i]) == nil {
            arr.append(str[i])
        } else {
            return false
        }
    }
    return true
}

uniqueChars("abcdefg")

// 1.2
func reverseStr(argumentName str: String) -> String {
    var newStr = String()
    for i in str.characters.indices {
        newStr.insert(str[i], atIndex: newStr.startIndex)
    }
    return newStr
}

reverseStr(argumentName: "hello")

func permutation(str1: String, str2: String) -> Bool {
    for i in str1.characters.indices {
        if str1[i].sort() != str2[i].sort() {
            return false
        }
    }
    return true
}



