//: Playground - noun: a place where people can play

import Foundation

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) { // you also have to initialize your new introduced property before calling super.init
        self.director = director
        super.init(name: name) // fully initializes MediaItem before modifying name property
    }
}

var titanic = Movie(name: "Titanic", director: "Steven Spielberg")
/* Another example of override and super.init()
init(newString:String) {
    super.init(string:newString)
    // Designed initialiser
}
override init(someString: String) {
    super.init(mainString: someString)
    // Override initialiser when subclass some class
}
 */
func music() -> Int {
    return 5
}

var FixedLengthRange: (num: Int) -> Int {
    return 3
}