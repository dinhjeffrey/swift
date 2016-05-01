// use "var" to declare a variable
var playerName = "Alice" // typed as a String
var age = 21  // typed as a int
var temperature = 72.6 // typed with a double
var activeMembership = true // typed as a Boolean


age+=5

var userName: String
var population: Int
/* Primitive types
 String
 Int
 Double
 Float
 Bool
 UInt (unsigned int)
 Character
 */

/* Collection types
 Array
 Dictionary
 Set
 */

// let is a constant, you can't change it. you can change var
var i = 0...9
// for
for i in 0 ..< 9 {
    print("The value ofi is: \(i)")
}

// for-in
for i in 0...9 { // inclusive
    print("The value of i is \(i)")
}


// Creating Optionals
var firstName: String? // either a string or nothing at all
var passportNumber: Int? // nil is similar to null, but nil applies to any type. Null usually applies to only objects
var phoneExtension: Int?

phoneExtension = 5 // remove to print dam @ if let unwrappedInt
//phoneExtension += 1      doesn't work because phoneExtension is optional int

// unwrapping optional int to regular int
// optional binding
if let unwrappedInt = phoneExtension {
    print(unwrappedInt)
} else { // if phoneExtension did equal nil
    print("dam")
}


// Creating Functions
// function and the type it returns -> String
// ** parameters passed into Swift function are treated as an immutable value, a constant. you can put var in front of someNumber to make it a variable
func createMessage(someNumber: Int, secondNumber: Int) -> String {
    print("You passed in the number: \(someNumber) + \(someNumber)")
    let message = "Simplicity is the ultimate sopistication."
    print(message)
    return message
}

// every argument after the 1st argument, you have to pass in the parameter name
let result = createMessage(99, secondNumber: 100)


// Defining a Class
class Appliance { // classes need an initalizer, all var must have initial value.
    // properties
    var manufacturer: String
    var model: String
    var voltage: Int
    var capacity: Int?
    
    // default initializer. can create different inits if they have different parameter signatures
    init() {
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = 120
    }
    
    // methods
    func getDetails() -> String {
        var message = "This is the \(self.model) from \(self.manufacturer)."
        if self.voltage >= 220 {
            message += "This model is for European usage"
        }
        return message
    }
}

// ... later ...
// create new objects
var kettle = Appliance()
kettle.manufacturer = "megappliace, inc."
kettle.model = "TeaMaster 5000"
kettle.voltage = 221
let details = kettle.getDetails()
print(details)
