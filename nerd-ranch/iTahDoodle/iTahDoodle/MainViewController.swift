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

    
    private var items: [String] = [] // empty array of our item list

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func insertTapped(sender: AnyObject) { // when tap on button, if itemTextField.text is not nill, let text = itemTextField.text and where the character count > 0, then append the text to items list, and reset itemTextField.text back to ""
        
        print("Add to-do item: \(itemTextField.text)")
        
        if let text = itemTextField.text where itemTextField.text?.characters.count > 0   {
            items.append(text)
            itemTextField.text = ""
        }
        
        print("Add to-do item: \(items)")
        
        tableView.reloadData() // reload tableView data to display updated items
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count // array count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath) // dynamic prototype nameCell target. dequeue makes it so the table scrolling is efficient
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        print("in cellForRowAtIndexPath")
        return cell
        
    }
}

