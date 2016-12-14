//
//  ViewController.swift
//  best-burrito
//
//  Created by Lisa on 10/5/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import UIKit
import GooglePlaces

class HomeViewController: UIViewController, GMSAutocompleteViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rateButtonPressed() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        self.navigationController?.pushViewController(autocompleteController, animated: true)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let rateController = storyboard.instantiateViewController(withIdentifier: "RateViewController") as! RateViewController
        rateController.restaurantString = place.name
        rateController.placeID = place.placeID
        
        self.navigationController?.popViewController(animated: false)
        self.navigationController?.pushViewController(rateController, animated: true)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

