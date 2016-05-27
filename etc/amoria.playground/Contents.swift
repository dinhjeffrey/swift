//: Playground - noun: a place where people can play


// ARRAY

var shoppingList = ["kerning city", "henesys", "iron pig"]

shoppingList.append("edelstein city")
shoppingList += ["orange mushies!"]
shoppingList[1...2] = ["crimson balrog", "pink adventurer cape"]
shoppingList
shoppingList.insert("jingapu", atIndex: 3)
shoppingList
shoppingList.removeAtIndex(2)
shoppingList
shoppingList.removeLast()
shoppingList
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("At index \(index) exists the element \(value)")
}


// SET
var fairyTale = Set<Double>()
var AACF: Set<String> = ["Janice", "Jack", "Nicole", "Michelle"]

var hungerGames: Set = ["Katniss"]
AACF.contains("Amoria")

AACF.sort()

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭", "🐔"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals) // isDisjointWith evaluates to true if doesn't have any similar elements

// DICTIONARY
var airports: [String: String] = ["XYZ": "Toronto", "Dub": "Dublin"]
airports["LHR"] = "London"
airports
airports["Dub"] = nil
airports

for (airportCode, airportName) in airports {
    print("airport code is \(airportCode): airport name is \(airportName)")
}

for airportCode in airports.keys {
    print("\(airportCode)")
}
for airportName in airports.values {
    print("\(airportName)")
}
// create an array instance using dictionary keys or values
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
















