/*              (✿ ♥‿♥)                 ╘[◉﹃◉]╕                      ᕙ(⇀‸↼‶)ᕗ
 Ｏ(≧▽≦)Ｏ	              ❤ Amoria ❤                       ★~(◡﹏◕✿)
 (ﾉ◕ヮ◕)ﾉ*:･ﾟ✧            (づ￣ ³￣)づ                    (づ｡◕‿‿◕｡)づ
 */

import UIKit

let view = UIView()
let labelRect = CGRect(x: 20, y: 20, width: 150, height: 150)
let label = UILabel(frame: labelRect)
label.backgroundColor = UIColor.blueColor()
label.text = "Hello"
view.addSubview(label)

print(label.text)

let path = UIBezierPath()
path.moveToPoint(CGPoint(x: 80, y: 50))
path.addLineToPoint(CGPoint(x: 140, y: 150))
path.addLineToPoint(CGPoint(x: 10, y: 150))
path.closePath()
UIColor.greenColor().setFill()
path.fill()


