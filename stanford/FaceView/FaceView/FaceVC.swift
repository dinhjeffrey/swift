//
//  ViewController.swift
//  FaceView
//
//  Created by jeffrey dinh on 6/9/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class FaceVC: UIViewController {
    // stored property
    var expression = FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Grin) {
        didSet {
            updateUI()
        }} // update every time after the first time hook up
    @IBOutlet weak var faceView: FaceView! { didSet {
        faceView.addGestureRecognizer(UIPinchGestureRecognizer(
            target: faceView,
            action: #selector(FaceView.changeScale(_:))
            ))
        updateUI()
        }} // update first time view hooked up
    
    private var mouthCurvatures = [FacialExpression.Mouth.Frown: -1.0, .Grin: 0.5, .Smile: 1.0, .Smirk: -0.5, .Neutral: 0.0]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed: 0.5, .Furrowed: -0.5, .Normal:0.0]
    
    private func updateUI() {
        switch expression.eyes {
        case .Squinting: faceView.eyesOpen = false
        case .Open: faceView.eyesOpen = true
        case .Closed: faceView.eyesOpen = false
        }
        faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
    }
    
    
    
    
}

