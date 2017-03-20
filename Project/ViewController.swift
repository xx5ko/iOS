//
//  ViewController.swift
//  Project
//
//  Created by Petko Chakov on 3/20/17.
//  Copyright © 2017 Petko Chakov. All rights reserved.
//

import UIKit
import GooglePlaces
import CoreLocation

class ViewController: UIViewController {
    
    var placesClient: GMSPlacesClient!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesClient = GMSPlacesClient.shared()
        
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
    

    @IBAction func getCurrentPlace(_ sender: UIButton) {
        
        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                        .joined(separator: "\n")
                }
            }
        })
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
