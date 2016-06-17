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
    

    @IBAction func zoomGraph(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .Changed {
            graphView.scale  *= recognizer.scale
            recognizer.scale = 1.0
        }
    }




}
