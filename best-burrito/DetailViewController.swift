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

class DetailViewController: UIViewController, LocateOnTheMap {
    
    var delegate: LocateOnTheMap!
    
    @IBOutlet var burritoNameLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    var burritoName = ""
    var restaurantName = ""

    var searchResultController:SearchResultsController!
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(self.googleMapsView)
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
    }
    
    
    func locateWithLongitude(lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        DispatchQueue.main.async { () -> Void in
            let position = CLLocationCoordinate2DMake(lat, lon)
            let marker = GMSMarker(position: position)
            
            let camera  = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 10)
            self.googleMapsView.camera = camera
            
            marker.title = title
            marker.map = self.googleMapsView
        }
    }
}
