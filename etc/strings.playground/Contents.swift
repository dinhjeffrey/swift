/* AMORIA ^_^ */

import Foundation



let decimalExponent = 8e2
let oneMillion = 1_000_000

let defaultColorName = "red"
var userDefinedColorName: String? = "blue"

var colorNameToUse = userDefinedColorName ?? defaultColorName

print(colorNameToUse)

print("\'\u{1F425}\'\r\u{1F425}")

let e = "\u{0065}\u{0301}"
let eCount = e.endIndex.advancedBy(0) // end index is 2, character.count is 1. endIndex.advanceBy(-1) is 0...
print("\u{0065}\u{0301}")

var greeting = "Amoria"

greeting[greeting.endIndex.predecessor()] // can't use endIndex to access a character (out of range). But can use to add a character to the end

for index in greeting.characters.indices {
    print("\(greeting[index])")
}

greeting.insertContentsOf(" Maplestory".characters, at: greeting.endIndex)


let range = greeting.endIndex.advancedBy(-6)..<greeting.endIndex
greeting.removeRange(range)

"\u{e9}" == "\u{65}\u{301}" // both are é


