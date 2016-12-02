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

class DetailViewController: UIViewController {
    
    @IBOutlet var burritoNameLabel: UILabel!
    
    var burritoName = String()
    
    func viewWillAppear(animated: Bool) {
        burritoNameLabel.text = burritoName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
