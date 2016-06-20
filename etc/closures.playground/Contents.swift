/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 
 I`m confused on closures :(
 */

import Foundation



func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int { // CANNOT access nested function at all on the outside
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let guardian = makeIncrementer(forIncrement: 10)
guardian()
guardian()
guardian()
let angel = guardian
guardian()
angel()
guardian()
angel()

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.removeAtIndex(0) } // customerProvider is () -> String

func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeAtIndex(0) } )

func serveCustomer2(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer2(  customersInLine.removeAtIndex(0)  )


let randomNums = [123, 22, 44444, 332, 5135, 66, 4, 2]

let filterNums = randomNums.filter() { $0 > 300 }

filterNums

print("\u{2764}")
/*
The @autoclosure attribute implies the @noescape attribute, which is described above in Nonescaping Closures. If you want an autoclosure that is allowed to escape, use the @autoclosure(escaping) form of the attribute.
 */

// SYNTAX - NONESCAPING CLOSURE
func someFunction(@noescape someClosure: () -> ()) {
    // have something in here
}

// An example of a method that we already encountered before that have @noescape, sort(_:)
var someCharactersInAnime = ["Asuna", "Kirito", "Eren"]
someCharactersInAnime.sort()
var sortedAnimeCharacters = someCharactersInAnime.sort() {$0>$1}
sortedAnimeCharacters

/* VINCENT (noescape) - @noescape tells the compiler that the passed-in closure can NOT be used outside the func its passed into, enables control-flow-like functions to be more transparent about hteir behavior */

var closureVariable: ( () -> Void)?

func prepareToTakeBriefCase(@noescape avengence: () -> Void) {
    // 1. Can't store it
    // closureVariable = avengence
    
    // 2. Can't capture it in another closure
     // tryToLetTheClosureEscape(avengence)
    
    // 3. can't run asynchronously
    //dispatch_async(dispatch_get_main_queue(), avengence)
    
}

func tryToLetTheClosureEscape(fleeingClosure: () -> Void ) {
    // empty
}





/* Autoclosure

 AUTOCLOSURE - is a closure automatically created to wrap an expression passed in as an argument to a function. When called, it returns the value of the expression wrapped inside it. 
     Autoclosure implies non-escaping closure
 
 */

// Consider a function that takes one argument, a simple closure that takes no arguments:

func tryToLetTheAutoclosureEscape(fleeingClosure: () -> Bool) {
    // empty
}

func funcAutoClosure(@autoclosure(escaping) evaluate: () -> Bool) {
    if evaluate() {
        print("It's true")
    }
    tryToLetTheAutoclosureEscape(evaluate)
}
// To call this function, pass in a closure
//funcAutoClosure() {3 > 1}
//funcAutoClosure() {2 > 1}
//funcAutoClosure() {3 < 1}
funcAutoClosure(3 > 1) // {3 > 1}




