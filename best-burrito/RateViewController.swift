//
//  RateViewController.swift
//  best-burrito
//
//  Created by Lisa on 10/5/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GooglePlaces

class RateViewController: UIViewController, UISearchBarDelegate {
    
    var restaurantString: String?
    var placeID: String?
    
    var searchResults: [String]!
    
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var burritoName: UITextField!
    @IBOutlet weak var recommended: UISegmentedControl!

    let ref = FIRDatabase.database().reference(withPath: "best-burrito")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        restaurantName.text = restaurantString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitRating(_ sender: Any) {
        let placeIdText = placeID
        let restaurantNameText = restaurantName.text
        let burritoNameText = burritoName.text
        let selection = recommended.selectedSegmentIndex == 0
        
        let burritoItem = BurritoItem(placeId:      placeIdText!,
                                      name:         burritoNameText!,
                                      restaurant:   restaurantNameText!,
                                      recommended:  selection)
        let burritoItemRef = self.ref.child(burritoNameText!.lowercased())
        
        burritoItemRef.setValue(burritoItem.toAnyObject())
        
    }
    
}
