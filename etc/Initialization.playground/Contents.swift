//: Playground - noun: a place where people can play

import Foundation

class SurveyQuestion {
    let text: String?
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion(text: "FOR THE KING")
beetsQuestion.response = "AY SYIR"
beetsQuestion.ask()
//DEFAULT INITIALIZERS
/*
 Swift provides default initializers for classes with all their properties defined and without an initializer inside it
 */
// Can't call text from outside until you initialized the class SurveyQuestion and can only call with the constant/variable you assigned it to

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem() // all properties of ShoppingListItem class have to have default values in order to initialize it. Can only do this when the class doresnt have an init()

// MEMBERWISE INITIALIZERS FOR STRUCTURE TYPES
/*
 structure types receive memberwise initializer if they do not define any of their own custom initializer
 */

struct Size2 {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size2(width: 2, height: 3)

// INITIALIZER DELEGATION FOR VALUE TYPES
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init(){} // same functionality as default initializer that structure would have received if it did not have its own custom initializer. Calling this initializer returns a Rect instance whose origin and size properties are both initialized with default values of Point(x: 0.0, y: 0.0) and Size(width: 0.0, height: 0.0)
    init(origin: Point, size: Size) { // memberwise initializer
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

var orc = Rect()
orc.origin
orc.origin.x

let elf = Rect(origin: Point(x: 1.1, y: 2.2), size: Size(width: 3.3, height: 4.4)) // memberwise initializer. simply assigns the origin and size argument values to the appropriate stored properties

// SETTING A DEFAULT PROPERTY VALUE WITH A CLOSURE OR FUNCTION
/*
 If a stored property's default value requires some customization or setup,
 you can use a closure or global function to provide a customized default value for that property
 */

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack) // false, true, false
                isBlack = !isBlack // false -> true
            }
            isBlack = !isBlack // new row
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column] // row 0, + column 1
    }
}

let harry = Chessboard()
// boardColors can be queried with the squareIsBlackAtRow utility function:
print(harry.squareIsBlackAtRow(0, column: 0))

struct Fahrenheit {
    let temperature: Double
    init() {
        temperature = 32.0
    }
}

let degrees = Fahrenheit()
degrees.temperature

class ThaiFood {
    let padThai: String?
    let bloodSoup = "bacteria"
    let nanProvince = "a province in Thailand?"
    init(dish: String) {
        self.padThai = dish
    }
}

let anthonyBourdain = ThaiFood(dish: "spicy") // Need an init() for class to access stored variables. cannot do memberwise initialization for class, CAN do it for structs

anthonyBourdain.padThai
anthonyBourdain.bloodSoup

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let unnamedMeat = Food()
print(namedMeat.name)
print(unnamedMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient() // inherited init since Food init() and RecipeIngredient  convenience init provides values for all properties
print(oneMysteryItem.quantity)
print(oneMysteryItem.name)
oneMysteryItem.name = "No Makeup"
print(oneMysteryItem.name)

// Failiable Initializers

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let noMakeUp = TemperatureUnit(symbol: "K")

// enums with rawValue automatically receives init?(rawValue)

enum iNeedAGirl: Character {
    case christina = "c", aegi = "a", vivs = "v"
}

let taeyang = iNeedAGirl(rawValue: "e")


class Document {
    var name: String?
    // this init creates a document with a nil name value
    init() {}
    
    // this init creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init(name: "Guardian Angel")!
        // self.name = "[Untitled]"
    }
    
    override init!(name: String) {
        super.init(name: "Complicated")
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

let redJumpSuitApparatus = AutomaticallyNamedDocument(name: "I see what`s going down")

print(redJumpSuitApparatus.name!)

let thinkingOutLoud = AutomaticallyNamedDocument()
print(thinkingOutLoud.name)

// required initializers

class RequiredInitClass {
    var name: String?
    required init() {
        name = "Sparks fly"
    }
}

class SubClassRequiredInit: RequiredInitClass {
    required init() {
        super.init()
        name = "Count on me"
    }
}

let bruno = SubClassRequiredInit()
print(bruno.name!)

// Setting a Default Property Value with a Closure or Function

struct Chessboard2 {
    let boardColors: String = {
        return "black"
    }() // automatically initializes this closure and sets it to a constant property when Chessboard2 gets initialized
}

let myHeart = Chessboard2()
myHeart.boardColors








