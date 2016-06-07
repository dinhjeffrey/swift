//: Playground - noun: a place where people can play

import UIKit

let a = 5
switch a { // Swift does not require breaks in switch statements. It automatically stops when matching a case.
    case 5: print("A IS 5")
    fallthrough // fallthrough tells the switch statement to go to the next immediate switch case and execute without having to match it
    case 7: print("A IS 7")
    default: print("ONE PUNCH MAN ROX")
}

var statusCode: Int = 444
var errorString: String = "The request failed with the error: "

switch statusCode {
case 100, 101: errorString += "Informational, \(statusCode)."
    
case 204: errorString += "Successful but no content, 204" // if 204, never gets to where clause without FALLTHROUGH
    
case 300...307: errorString += "Redirection, \(statusCode)."
    
case 400...417: errorString += "Client error, \(statusCode)."
    
case 500...505: errorString += "Server error, \(statusCode)."
    
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505: errorString = "\(unknownCode) is an unknown error code. Please review the request and try again."
default: errorString = "Unexpected error encountered."
    // VALUE BINDING: binding unknownCode to value of statusCode
}

// WHERE: Dynamic filter within the Switch statement. lets you skip over values that would otherwise go into the Default case

// TUPLE: finite grouping of two or more values that are deemed by the developer to be logically related

let error = (code: statusCode, error: errorString) // tuple

error.code
error.error


// (_) is wildcard that matches anything
// Pattern Matching in Tuples
let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case(404, 404): print("No items found")
case(404, _): print("First item not found")
case(_, 404): print("Second item not found")
default: print("All items found")
}

// IF-CASES with WHERE clauses
let age = 25
if case 18...25 = age where age >= 21 {
    print("WE ARE YOUNG AND FREE. LET'S PARTY IN UCSB")
}

let point = (x:1, y:4)
switch point {
case let q1 where point.x > 0 && point.y > 0: print("\(q1) is in quadrant 1")
default: print("I don't want to write the rest of this switch statement")
}
