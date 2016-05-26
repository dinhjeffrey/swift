//
//  ViewController.swift
//  assignment1-calculator
//
//  Created by jeffrey dinh on 5/26/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    
    @IBOutlet weak var display: UILabel!
    @IBAction func tappedButton(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurentlyInDisplay = display.text!
            display.text = textCurentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
//        var number: String? = nil
//        if number == nil {
//            number = sender.currentTitle!
//            answerScreen.text = number!
//        } else {
//            number = sender.currentTitle!
//            answerScreen.text?.stringByAppendingString(number!)
//        }
//        print("\(number) was pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

