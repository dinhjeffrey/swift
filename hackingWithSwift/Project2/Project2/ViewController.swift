//
//  ViewController.swift
//  Project2
//
//  Created by jeffrey dinh on 5/23/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var countriesRandomized = [String]()
    var player: AVAudioPlayer?
   
    
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.tag == correctAnswer {
            correctSound()
            self.title = "+1"
            score += 1
            scoreLabel.text = String(score)
        } else {
            wrongSound()
            self.title = "-1"
            score -= 1
            scoreLabel.text = String(score)
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
        random()
    }
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
        
        random()
        
        askQuestion() // since func askQuestion was initialized, we update the variable countriesRandomized when calling random()
    }
    
    func random() {
        countriesRandomized = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
    }

    func askQuestion(action: UIAlertAction! = nil) {
        button1.setImage(UIImage(named: countriesRandomized[0]), forState: .Normal)
        button2.setImage(UIImage(named: countriesRandomized[1]), forState: .Normal)
        button3.setImage(UIImage(named: countriesRandomized[2]), forState: .Normal)
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        self.title = countriesRandomized[correctAnswer].uppercaseString
    }
    
    func correctSound() {
        let url = NSBundle.mainBundle().URLForResource("correct", withExtension: "mp3")!
        
        guard let player = try? AVAudioPlayer(contentsOfURL: url) else { return }
        
        player.prepareToPlay()
        player.play()
    }
    
    func wrongSound() {
        let url = NSBundle.mainBundle().URLForResource("wrong", withExtension: "mp3")!
        
        guard let player = try? AVAudioPlayer(contentsOfURL: url) else { return }
        
        player.prepareToPlay()
        player.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

