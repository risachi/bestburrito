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

class RateViewController: UIViewController {
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var burritoName: UITextField!
    @IBOutlet weak var recommended: UISegmentedControl!
    
    let ref = FIRDatabase.database().reference(withPath: "best-burrito")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitRating(_ sender: Any) {
        let restaurantNameText = restaurantName.text
        let burritoNameText = burritoName.text
        let selection = recommended.selectedSegmentIndex == 0
        
        let burritoItem = BurritoItem(name: burritoNameText!,
                                      restaurant: restaurantNameText!,
                                      recommended: selection)
        let burritoItemRef = self.ref.child(burritoNameText!.lowercased())
        
        burritoItemRef.setValue(burritoItem.toAnyObject())
        
    }
    
}
