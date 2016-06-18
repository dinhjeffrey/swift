//
//  GraphVC.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 6/13/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class GraphVC: UIViewController {
    
    
    @IBOutlet weak var graphView: GraphV! {
        didSet { }
    }
    @IBAction func moveGraph(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .Changed {
            let translation = recognizer.translationInView(graphView)
            graphView.graphOrigin = CGPoint(x: graphView.graphOrigin!.x + translation.x, y: graphView.graphOrigin!.y + translation.y)
            
            recognizer.setTranslation(CGPointZero, inView: graphView) // By resetting the translation to zero all the time, you end up getting incremental translation
        }
        
    }
    

    @IBAction func zoomGraph(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .Changed {
            graphView.scale  *= recognizer.scale
            recognizer.scale = 1.0
        }
    }




}
