//
//  GraphVC.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 6/13/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class GraphVC: UIViewController {
    
    var graphV = GraphV()
    
    @IBOutlet weak var graphView: GraphV! {
        didSet {
            graphView.addGestureRecognizer(UIPinchGestureRecognizer(
                target: graphView,
                action: #selector(GraphV.changeScale(_:))
                ))
            //updateUI()
        }
    }
    
    
    
    
    
    
}
