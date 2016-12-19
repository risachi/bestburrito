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
import GoogleMaps
import GooglePlaces

class DetailViewController: UIViewController {
    
    @IBOutlet var burritoNameLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var burritoName = ""
    var restaurantName = ""
    var phoneNumberName = ""
    var addressName = ""
    var placeIdName = ""
    var coordinate = CLLocationCoordinate2D

    var resultsArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        burritoNameLabel.text = burritoName
        restaurantNameLabel.text = restaurantName
        phoneNumberLabel.text = phoneNumberName
        addressLabel.text = addressName
    }
    
    
    // Map
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let position = coordinate
        //let marker = GMSMarker(position: position)
        //marker.title = burritoName
        //marker.map = mapView
    }

}
