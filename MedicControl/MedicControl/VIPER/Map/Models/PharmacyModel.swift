//
//  PharmacyModel.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 01/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

struct PharmacyModel {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    var open: Bool
    let latitude: Double
    let longitude: Double
    
    init(name: String, open: Bool, key: String = "", latitude: Double, longitude: Double) {
        self.ref = nil
        self.key = key
        self.name = name
        self.open = open
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let open = value["open"] as? Bool,
            let latitude = value["latitude"] as? Double,
            let longitude = value["longitude"] as? Double else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.open = open
        self.longitude = longitude
        self.latitude = latitude
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "open": open,
            "latitude": latitude,
            "longitude": longitude
        ]
    }
}
