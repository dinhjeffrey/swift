/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 
 I`m confused on closures :(
 */

import Foundation



func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
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

/*
The @autoclosure attribute implies the @noescape attribute, which is described above in Nonescaping Closures. If you want an autoclosure that is allowed to escape, use the @autoclosure(escaping) form of the attribute.
 */

