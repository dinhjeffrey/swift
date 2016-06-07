//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]


// The items stored in library are still Movie and Song instances behind the scenes. However, if you iterate over the contents of this array, the items you receive back are typed as MediaItem, and not as Movie or Song. In order to work with them as their native type, you need to check their type, or downcast them to a different type, as described below.


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// Prints "Media library contains 2 movies and 3 songs"


// Because downcasting can fail, the type cast operator comes in two different forms. The conditional form, as?, returns an optional value of the type you are trying to downcast to. The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.

// Use the conditional form of the type cast operator (as?) when you are not sure if the downcast will succeed. This form of the operator will always return an optional value, and the value will be nil if the downcast was not possible. This enables you to check for a successful downcast.

// “if let movie = item as? Movie”, which can be read as:

// “Try to access item as a Movie. If this is successful, set a new temporary constant called movie to the value stored in the returned optional Movie.”

// AnyObject can represent an instance of any class type. 
// Any can represent an instance of any type at all, including function types.

let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
    ]

for object in someObjects {
    let movie = object as! Movie
    print("Movie: \(movie.name), dir. \(movie.director)")
}
// Movie: 2001: A Space Odyssey, dir. Stanley Kubrick
// Movie: Moon, dir. Duncan Jones
// Movie: Alien, dir. Ridley Scott


// For an even shorter form of this loop, downcast the someObjects array to a type of [Movie] instead of downcasting each item:
    
    for yo in someObjects as! [Movie] {
        print("Movie: \(yo.name), dir. \(yo.director)")
}
// Movie: 2001: A Space Odyssey, dir. Stanley Kubrick
// Movie: Moon, dir. Duncan Jones
// Movie: Alien, dir. Ridley Scott

// Any
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
