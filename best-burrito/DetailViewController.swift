//
//  DetailViewController.swift
//  best-burrito
//
//  Created by Lisa on 12/2/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleMapsCore

class DetailViewController: UIViewController {
    
    @IBOutlet var burritoNameLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    var burritoName = ""
    var restaurantName = ""

    var resultsArray = [String]()
    var googleMapsView:GMSMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        burritoNameLabel.text = burritoName
        restaurantNameLabel.text = restaurantName
    }
    
    
    // Map
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
