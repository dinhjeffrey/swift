//
//  DetailViewController.swift
//  Project1
//
//  Created by jeffrey dinh on 5/19/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet private weak var detailImageView: UIImageView!

    private var detailItem: String? {
        didSet { // executed any time the property value has changed
            // Update the view.
            self.configureView()
        }
    }

    private func configureView() {
        // Update the user interface for the detail item.
        if let detail: String = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        self.title = detailItem // Detail View Controller title
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    private func shareTapped() {
        if (detailImageView.image == nil) {
            detailImageView.image is! String = "No image was selected"
        }
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

