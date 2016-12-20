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
    var latName: Double?
    var longName: Double?

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
        
        let mapCamera = GMSCameraPosition.camera(withLatitude: latName!,
                                              longitude: longName!,
                                              zoom: 15)
        
        let coordinate = CLLocationCoordinate2D(latitude: latName!, longitude: longName!)
        let marker = GMSMarker(position: coordinate)
        marker.title = burritoName
        marker.map = mapView
        mapView.camera = mapCamera
    }

}
