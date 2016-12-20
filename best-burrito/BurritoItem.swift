//
//  BurritoItem.swift
//  best-burrito
//
//  Created by Lisa on 11/3/16.
//  Copyright © 2016 Lisa Hackenberger. All rights reserved.
//

import Foundation
import Firebase
import GooglePlaces

struct BurritoItem {
    
    let key: String
    let placeId: String
    let name: String
    let restaurant: String
    let recommended: Bool
    let phoneNumber: String
    let address: String
    let lat: Double
    let long: Double
    let ref: FIRDatabaseReference?
    
    init(placeId: String, name: String, restaurant: String, recommended: Bool, phoneNumber: String, address: String, lat: Double, long: Double, key: String = "") {
        self.key = key
        self.placeId = placeId
        self.name = name
        self.restaurant = restaurant
        self.recommended = recommended
        self.phoneNumber = phoneNumber
        self.address = address
        self.lat = lat
        self.long = long
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        placeId = snapshotValue["placeId"] as! String
        name = snapshotValue["name"] as! String
        restaurant = snapshotValue["restaurant"] as! String
        recommended = snapshotValue["recommended"] as! Bool
        phoneNumber = snapshotValue["phoneNumber"] as! String
        address = snapshotValue["address"] as! String
        lat = snapshotValue["lat"] as! Double
        long = snapshotValue["long"] as! Double
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "placeId": placeId,
            "name": name,
            "restaurant": restaurant,
            "recommended": recommended,
            "phoneNumber": phoneNumber,
            "address": address,
            "lat": lat,
            "long": long
        ]
    }
    
}
