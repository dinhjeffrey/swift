//: Playground - noun: a place where people can play

import UIKit

// Create a UIBezierPath
let path = UIBezierPath()

// Move around, add lines or arcs to the path
path.moveToPoint(CGPoint(x: 80, y: 50))
path.addLineToPoint(CGPoint(x: 140, y: 150))
path.addLineToPoint(CGPoint(x: 10, y: 150))
// Close the path
path.closePath()

// Set attributes and stroke / fill
UIColor.greenColor().setFill() // note this is a method in UIColor, not UIBezierPath
UIColor.redColor().setStroke() // note this is a method in UIColor, not UIBezierPath
path.lineWidth = 3.0             // method in UIBezierPath, not UIColor
path.fill()                      // method in UIBezierPath
path.stroke()                    // method in UIBezierPath

// FRAME and CENTER is for positioning in your superview
// BOUNDS is for drawing!!
