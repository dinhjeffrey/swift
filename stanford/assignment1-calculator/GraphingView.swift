//
//  GraphingView.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 6/15/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

@IBDesignable
class GraphingView: UIView {
    @IBInspectable var axesColor: UIColor = UIColor.blueColor() { didSet { setNeedsDisplay() } }
    
    
    
    
    
   
    override func drawRect(rect: CGRect) {
        let axes = AxesDrawer(color: axesColor, contentScaleFactor: contentScaleFactor)
        axes.drawAxesInRect(bounds, origin: <#T##CGPoint#>, pointsPerUnit: <#T##CGFloat#>)
        
    }
    

}
