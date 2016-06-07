/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 */

import Foundation

// ASSOCIATED VALUES
/*
 allow you to attach data to isntances of an enum and different
 cases can hv different types of associated values
 */
enum ShapeDimension {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case RightTriangle(width: Double, height: Double)
    
    // Methods = func, where they are located in the code. Enum, structure, or class
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case let .RightTriangle(width: w, height: h):
            return (w * h) / 2
        }
    }
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
        case let .RightTriangle(width: w, height: h):
            return w + h + sqrt((w * w) + (h * h))
        }
    }
}

let rockLee = ShapeDimension.Square(6)
rockLee.area()
rockLee.perimeter()

// RAW VALUES
/*
    can pre-populate with default values (or 'raw' values) which are all the same type.
    Raw values   1.) MUST be unique w/in enum declaration
                 2.) Can be string, char, int, or float-pt num types
 */

enum ASCIIControlChar: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case cReturn = "\r"
}

// IMPLICITLY ASSIGNED RAW VALUES
/*
    don't hv to explicitly assign raw value for ea case, but once one is assigned Swift is smart enough to catch on
 */

enum PlanetOrder: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

// ACCESS RAW VALUES

let earth = PlanetOrder.Earth.rawValue

// when the type is explicit, Swift defaults to using the case  name as the raw value

enum CompassNew: String {
    case North, South, East, West
}

let directionNew = CompassNew.North.rawValue



// INITIALIZING FROM A RAW VALUE

// Example: Id'ing Uranus from its raw value 7

let possiblePlanet = PlanetOrder(rawValue: 7)

// But not every int value will find a match (enum case) -> failable initializer
// So use optional binding to test if there is a match

let planetPositionToFind = 11
if let somePlanet = PlanetOrder(rawValue: planetPositionToFind) {
    print("we have a planet at position \(planetPositionToFind)")
} else {
    print("There is not a planet at position \(planetPositionToFind)")
}
