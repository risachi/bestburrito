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
    var phoneNumber = ""
    var placeIdName = ""

    var resultsArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        burritoNameLabel.text = burritoName
        restaurantNameLabel.text = restaurantName
        phoneNumberLabel.text = place.formatted_phone_number
    }
    
    
    // Map
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CLLocationCoordinate2D(latitude: 10, longitude: 10)
        let position = placeIdName as! CLLocationCoordinate2D
        let marker = GMSMarker(position: position)
        marker.title = burritoName
        marker.map = mapView
    }

}
