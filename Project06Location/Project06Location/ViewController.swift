//
//  ViewController.swift
//  Project06Location
//
//  Created by Han Jize on 2020/5/9.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel:UILabel!

    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myLocationButtonDidTouch(_ sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

