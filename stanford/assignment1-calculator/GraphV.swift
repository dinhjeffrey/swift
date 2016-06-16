//
//  GraphV.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 6/16/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

@IBDesignable
class GraphV: UIView {
    @IBInspectable var axesColor: UIColor = UIColor.blueColor() { didSet { setNeedsDisplay() } }
    var graphCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    
    
    
    
    override func drawRect(rect: CGRect) {
        let axes = AxesDrawer(color: UIColor.blackColor(), contentScaleFactor: contentScaleFactor)
        axes.drawAxesInRect(bounds, origin: graphCenter, pointsPerUnit: CGFloat(50.0))
        let path = UIBezierPath()
        
        path.stroke()
        
    }
}
