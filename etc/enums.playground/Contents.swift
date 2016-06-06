/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 */

import Foundation

// ASSOCIATED VALUES
/*
    allow you to attach data to isntances of an enum and different
    cases can have different types of associated values
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
        
        }
    }
    
}