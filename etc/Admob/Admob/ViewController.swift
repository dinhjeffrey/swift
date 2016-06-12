//
//  ViewController.swift
//  Admob
//
//  Created by jeffrey dinh on 6/12/16.
//  Copyright © 2016 jeffrey dinh. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {

    
    @IBOutlet weak var banner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.hidden = true
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        
        banner.delegate = self
        
        banner.adUnitID = "ca-app-pub-6692728200250631/5188343706"
        banner.rootViewController = self
        banner.loadRequest(GADRequest())
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        banner.hidden = false
    }
    
    func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        banner.hidden = true
    }


}

