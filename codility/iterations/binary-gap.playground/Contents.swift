
import Foundation

public func solution(N : Int) -> Int {
    let strBinary = String(N, radix: 2)
    var trailingOne: String.CharacterView.Index
    var strBinaryTrailing = String()
    for index in strBinary.characters.indices {
        if strBinary[index] == "1" {
            trailingOne = index
            print(index)
            strBinaryTrailing = strBinary.substringToIndex(trailingOne)
        }
    }
    
    let arrayOfZeroes = strBinaryTrailing.characters.split{$0 == "1"}.map(String.init)
    var longestConsecZeroes = 0
    for index in 0..<arrayOfZeroes.count {
        if arrayOfZeroes[index].characters.count > longestConsecZeroes {
            longestConsecZeroes = arrayOfZeroes[index].characters.count
        }
    }
    return longestConsecZeroes
}

solution(328)

//n=6=110_2 and n=328=101001000_2
