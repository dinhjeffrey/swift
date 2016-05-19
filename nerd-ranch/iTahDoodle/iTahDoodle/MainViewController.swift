//
//  ViewController.swift
//  iTahDoodle
//
//  Created by jeffrey dinh on 5/16/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemTextField: UITextField!

    
    private var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func insertTapped(sender: AnyObject) {
        
        print("Add to-do item: \(itemTextField.text)")
        
        if let text = itemTextField.text where itemTextField.text?.characters.count > 0   {
            items.append(text)
            itemTextField.text = ""
        }
        
        print("Add to-do item: \(items)")
        
        tableView.reloadData()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        
        
        
        return cell
        
        
        //STOP ON PAGE 365
    }
}

