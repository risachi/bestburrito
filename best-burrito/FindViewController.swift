//
//  FindViewController.swift
//  best-burrito
//
//  Created by Lisa on 10/14/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FindViewController: UITableViewController {
    let ref = FIRDatabase.database().reference(withPath: "best-burrito")

    var items: [BurritoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref.observe(.value, with: { snapshot in
            var newItems: [BurritoItem] = []
            for item in snapshot.children {
                let burritoItem = BurritoItem(snapshot: item as! FIRDataSnapshot)
                newItems.append(burritoItem)
            }
            
            self.items = newItems
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let burritoItem = items[indexPath.row]
        
        cell.textLabel?.text = burritoItem.name
        cell.detailTextLabel?.text = burritoItem.name
        
        return cell
    }
    
    
    

}
