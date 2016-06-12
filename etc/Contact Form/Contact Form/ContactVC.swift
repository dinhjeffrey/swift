//
//  ViewController.swift
//  Contact Form
//
//  Created by jeffrey dinh on 6/10/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit
import MessageUI

class ContactVC: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func send(sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let toRecipients = ["jjames@pacbell.net"]
            
            let mc = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            mc.setToRecipients(toRecipients)
            mc.setSubject(nameField.text!)
            mc.setMessageBody("Name: \(nameField.text!) \n\nEmail: \(emailField.text!) \n\nMessage: \(messageField.text!)", isHTML: false)
            print("can send mail")
            
            
            self.presentViewController(mc, animated: true, completion: nil)
        } else {
            print("failed to send")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        print("error is \(error) and result sent is \(MFMailComposeResultSent.rawValue))")
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResultFailed.rawValue:
            print("Failed")
        case MFMailComposeResultSaved.rawValue:
            print("Saved")
        case MFMailComposeResultSent.rawValue:
            print("Sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

