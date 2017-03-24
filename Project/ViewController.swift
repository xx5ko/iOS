//
//  ViewController.swift
//  Project
//
//  Created by Petko Chakov on 3/20/17.
//  Copyright © 2017 Petko Chakov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import PeekPop

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var horizontalAccuracy: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var verticalAccuracy: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    @IBAction func resetDistance(_ sender: AnyObject) {
        startLocation = nil
    }
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var locationManager: CLLocationManager = CLLocationManager()
        var startLocation: CLLocation!
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    
        
        func locationManager(_ manager: CLLocationManager,
                             didUpdateLocations locations: [CLLocation])
        {
            let latestLocation: CLLocation = locations[locations.count - 1]
            
            latitude.text = String(format: "%.4f",
                                   latestLocation.coordinate.latitude)
            longitude.text = String(format: "%.4f",
                                    latestLocation.coordinate.longitude)
            horizontalAccuracy.text = String(format: "%.4f",
                                             latestLocation.horizontalAccuracy)
            altitude.text = String(format: "%.4f",
                                   latestLocation.altitude)
            verticalAccuracy.text = String(format: "%.4f",
                                           latestLocation.verticalAccuracy)
            
            if startLocation == nil {
                startLocation = latestLocation
            }
            
            let distanceBetween: CLLocationDistance =
                latestLocation.distance(from: startLocation)
            
            distance.text = String(format: "%.2f", distanceBetween)
        }
        
        func locationManager(_ manager: CLLocationManager,
                             didFailWithError error: Error) {
            
        }
        //
        func addSwipes() {
            // Left Swipe
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: Selector(("swipeLeft:")))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
            
            // Right Swipe
            let swipeRight = UISwipeGestureRecognizer(target: self, action: Selector(("swipeRight:")))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)
        }
        
        func swipeLeft(gestureRecognizer: UISwipeGestureRecognizer) {
        }
        
        func swipeRight(gestureRecognizer: UISwipeGestureRecognizer) {
            
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
