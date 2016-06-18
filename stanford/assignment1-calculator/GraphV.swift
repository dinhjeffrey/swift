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
    
    @IBInspectable var scale: CGFloat = 1.0 { didSet { setNeedsDisplay() }}
    @IBInspectable var graphOrigin: CGPoint? {didSet { setNeedsDisplay() }}
    let pointsPerUnit: CGFloat = 50.0
    
    
    var graphCenter: CGPoint {
        if graphOrigin == nil {
            graphOrigin = CGPoint(x: bounds.midX, y: bounds.midY)
        }
        return graphOrigin!
    }
    
    
    override func drawRect(rect: CGRect) {
        
        let axes = AxesDrawer(color: UIColor.blackColor(), contentScaleFactor: contentScaleFactor)
        axes.drawAxesInRect(bounds, origin: graphCenter, pointsPerUnit: pointsPerUnit * scale)
        let path = UIBezierPath()
        path.stroke()
    }
}
