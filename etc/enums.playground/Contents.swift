/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 */

import Foundation

// ASSOCIATED VALUES
/*
 allow you to attach data to instances of an enum and different
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

// when the type is explicit, Swift defaults to using the case name as the raw value

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


// RECURSIVE ENUMERATIONS

// enums that take a math expression

indirect enum MathExpression {
    case Number(Int)
    case Add(MathExpression, MathExpression)
    case Subtract(MathExpression, MathExpression)
    case Multiply(MathExpression, MathExpression)
    case Divide(MathExpression, MathExpression)
}
func evaluate(expression: MathExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Add(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Subtract(let left, let right):
        return evaluate(left) - evaluate(right)
    case . Multiply(let left, let right):
        return evaluate(left) * evaluate(right)
    case .Divide(let left, let right):
        return evaluate(left) / evaluate(right)
    }
}

// evalute (25 * 5) - 20
let twentyFive = MathExpression.Number(25)
let five = MathExpression.Number(5)
let multiply = MathExpression.Multiply(twentyFive, five)
let subtract = MathExpression.Subtract(multiply, MathExpression.Number(20))
print(subtract)

// EXAMPLE --> rock, paper, scissors, lizard, spock

// Define enum for result & hand options

enum HandGesture {
    case Rock, Paper, Scissors, Lizard, Spock
}
enum Result: String {
    case Win, Lose, Draw
}

// Define function on match

func matches(firstPlayer a: HandGesture, secondPlayer b: HandGesture) -> Result {
    // if sttmt -> compare hand gestures
    if   a == .Spock && (b == .Scissors || b == .Rock) ||
        (a ==  .Rock && (b == .Lizard || b == .Scissors)) ||
        (a ==  .Paper && (b == .Spock || b == .Rock)) ||
        (a ==  .Scissors && (b == .Lizard || b == .Paper)) ||
        (a ==  .Lizard && (b == .Spock || b == .Paper)) {
        return .Win
    } else if a == b {
        return .Draw
    } else {
        return .Lose
    }
}

matches(firstPlayer: .Rock, secondPlayer: .Scissors)

matches(firstPlayer: .Spock, secondPlayer: .Spock)

matches(firstPlayer: .Paper, secondPlayer: .Scissors)











