//
//  ViewController.swift
//  Project2
//
//  Created by jeffrey dinh on 5/23/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit
import GameplayKit


class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var countriesRandomized = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        countriesRandomized = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        askQuestion()
    }

    func askQuestion() {
        button1.setImage(UIImage(named: countriesRandomized[0]), forState: .Normal)
        button2.setImage(UIImage(named: countriesRandomized[1]), forState: .Normal)
        button3.setImage(UIImage(named: countriesRandomized[2]), forState: .Normal)
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        self.title = countriesRandomized[correctAnswer].uppercaseString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
