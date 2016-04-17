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

func createMessage() {
    let message = "Simplicity is the ultimate sopistication."
    print(message)
}

createMessage()





