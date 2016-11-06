//
//  BurritoItem.swift
//  best-burrito
//
//  Created by Lisa on 11/3/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import Foundation
import Firebase

struct BurritoItem {
    
    let key: String
    let name: String
    let ref: FIRDatabaseReference?
    
    init(name: String, key: String = "") {
        self.key = key
        self.name = name
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name
        ]
    }
    
}
