//
//  ViewController.swift
//  The Night Porter
//
//  Created by jeffrey dinh on 4/16/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeBackground(sender: AnyObject) {
        view.backgroundColor = UIColor.darkGrayColor()
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

