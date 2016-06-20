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
    @IBAction func panGraph(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .Changed {
            let translation = recognizer.translationInView(graphView)
            graphView.graphOrigin = CGPoint(x: graphView.graphOrigin!.x + translation.x, y: graphView.graphOrigin!.y + translation.y)
            recognizer.setTranslation(CGPointZero, inView: graphView) // By resetting the translation to zero all the time, you end up getting incremental translation
        }
    }
    @IBAction func singleTap(recognizer: UITapGestureRecognizer) {
        let pointTapped = recognizer.locationInView(graphView)
        print("bounds.width are \(graphView.bounds.width)")
        print("x: \(pointTapped.x) and y: \(pointTapped.y)")
        print("graphCenter.x is \(graphView.graphCenter.x) and graphCenter.y is \(graphView.graphCenter.y)")
    }
    
    @IBAction func doubleTapGraph(recognizer: UITapGestureRecognizer) {
        let pointTapped = recognizer.locationInView(graphView)
        print("x: \(pointTapped.x) and y: \(pointTapped.y)")
        graphView.scale = 1.0
        graphView.graphOrigin = CGPoint(x: pointTapped.x, y: pointTapped.y)
    }
    @IBAction func pinchGraph(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .Changed {
            graphView.scale  *= recognizer.scale
            recognizer.scale = 1.0
        }
    }
    
    
    func graphPlot(sender: GraphV) -> [(x: Double, y: Double)]? {
        // Performance fix to remove sluggish behavior (especially when screen is zoomed out):
        // a. the difference between minXDegree and maxXDegree will be high when zoomed out
        // b. the screen width has a fixed number of pixels, so we need to iterate only
        //    for the number of available pixels
        // c. loopIncrementSize ensures that the count of var plots will always be fixed to
        //    the number of available pixels for screen width

        var plots = [(x: Double, y: Double)]()
        let minXDegree = Double(sender.minX) * (180 / M_PI)
        let maxXDegree = Double(sender.maxX) * (180 / M_PI)
        let loopIncrementSize = (maxXDegree - minXDegree) / sender.availablePixelsInXAxis
        for point in Double(minXDegree).stride(through: Double(maxXDegree), by: Double(loopIncrementSize)) {
            let radian = Double(point) * (M_PI / 180)
            // guard radian.isNormal || radian.isZero else { continue }
            plots.append((
                x: radian,
                y: sin(radian)
            ))
        }
        // print("minXDegree is \(minXDegree) and maxXDegree is \(maxXDegree)")
        return plots
    }
}
