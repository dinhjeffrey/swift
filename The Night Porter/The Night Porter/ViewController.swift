//
//  ViewController.swift
//  The Night Porter
//
//  Created by jeffrey dinh on 4/16/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func darkMode(sender: AnyObject) {
        view.backgroundColor = UIColor.darkGrayColor()
        
        for eachControl in view.subviews {
            if let label = eachControl as? UILabel {
                label.textColor = UIColor.lightGrayColor()
            }
        }
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

