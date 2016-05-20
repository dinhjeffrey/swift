//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by Simon Allardice on 10/23/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Create task arrays
    var dailyTasks = [
        Task(name: "Check all windows", type: .Daily, completed: false, lastCompleted: nil ),
        Task(name: "Check all doors", type: .Daily, completed: false, lastCompleted: nil ),
        Task(name:  "Check temperature of freezer", type: .Daily, completed: false, lastCompleted: nil ),
        Task(name: "Check the mailbox at the end of the lane", type: .Daily, completed: false, lastCompleted: nil ),
        Task(name: "Empty trash containers", type: .Daily, completed: false, lastCompleted: nil ),
        Task(name: "If freezing, check the water pipes outside", type: .Daily, completed: false, lastCompleted: nil )
    ]
    
    var weeklyTasks = [
        Task(name: "Check inside all of the unoccupied cabins", type: .Weekly, completed: false, lastCompleted: nil ),
        Task(name:  "Run all faucets for 30 seconds", type: .Weekly, completed: false, lastCompleted: nil ),
        Task(name: "Walk the perimeter of property", type: .Weekly, completed: false, lastCompleted: nil ),
        Task(name:"Arrange for dumpster pickup", type: .Weekly, completed: false, lastCompleted: nil )
    ]
    
    
    var twoWeekTasks = [
        Task(name:"Run test on security alarm", type: .TwoWeeks, completed: false, lastCompleted: nil ),
        Task(name:"Check all motion detectors", type: .TwoWeeks, completed: false, lastCompleted: nil ),
        Task(name:"Test smoke alarms", type: .TwoWeeks, completed: false, lastCompleted: nil )
    ]
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBAction func toggleDarkMode(sender: AnyObject) {
        let darkModeSwitch = sender as! UISwitch
        if darkModeSwitch.on {
            view.backgroundColor = UIColor.darkGrayColor()
        } else {
            view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    
    @IBAction func resetList(sender: AnyObject) {
        
        let confirm =  UIAlertController(title: "Are you sure?", message: "Really reset the list?", preferredStyle: .Alert)
        
        let yesAction =  UIAlertAction(title: "Yes", style: .Destructive, handler: {
        
            action in
            
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            for i in 0..<self.twoWeekTasks.count {
                self.twoWeekTasks[i].completed = false
            }
            self.taskTableView.reloadData()
            
        })
        
        let noAction =  UIAlertAction(title: "No!", style: .Default, handler: {
            action in
            print("that was a close one!")
        })
        
        // add actions to alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        // show it
        presentViewController(confirm, animated: true, completion: nil)
        
      
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clearColor()
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return twoWeekTasks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // now a task, not a string
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = twoWeekTasks[indexPath.row]
        default:
            break
        }
        // use the name property to set the value of the cell.
        cell.textLabel!.text = currentTask.name
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGrayColor()
            cell.accessoryType = .Checkmark
        } else {
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.accessoryType = .None
        }
        
        // set cell to transparent
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Every Two Weeks"
        default:
            return "This Should Not Be Here"
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let myAction = UITableViewRowAction(style: .Default, title: "Complete", handler: {
            // closure parameters
            action, indexPath in
            
            // find the right object and set it to completed
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.twoWeekTasks[indexPath.row].completed = true
            default:
                break
                
            }
            // refresh
            tableView.reloadData()
            
            // tell the table view it's done editing
            tableView.editing = false
        })
        
        let actions = [myAction]
        return actions
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected row: \(indexPath.row) in section: \(indexPath.section)")
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
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

