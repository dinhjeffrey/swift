/* AMORIA ^_^ */

import Foundation

let defaults = NSUserDefaults.standardUserDefaults()
let plist = defaults.objectForKey("foo")
defaults.setObject(plist, forKey: "foo")
print(plist)