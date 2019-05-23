//
//  MedicinesUserModel.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 09/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

struct MedicinesUserModel {
    
    let ref: DatabaseReference?
    let key: String
    let userName: String
    let tabletNameKey: String
    let tabletNameReal: String
    let numberOfTablets: Int
    let remainingTablets: Int
    
    init(userName: String, key: String = "", tabletNameKey: String, tabletNameReal: String, numberOfTablets: Int, remainingTablets: Int) {
        self.ref = nil
        self.key = key
        self.userName = userName
        self.tabletNameKey = tabletNameKey
        self.tabletNameReal = tabletNameReal
        self.numberOfTablets = numberOfTablets
        self.remainingTablets = remainingTablets
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject],
            let userName = value["userName"] as? String,
            let tabletNameKey = value["tabletNameKey"] as? String,
            let tabletNameReal = value["tabletNameReal"] as? String,
            let numberOfTablets = value["numberOfTablets"] as? Int,
            let remainingTablets = value["remainingTablets"] as? Int
            else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.userName = userName
        self.tabletNameKey = tabletNameKey
        self.tabletNameReal = tabletNameReal
        self.numberOfTablets = numberOfTablets
        self.remainingTablets = remainingTablets
    }
    
    func toAnyObject() -> Any {
        return [
            "userName": userName,
            "tabletNameKey": tabletNameKey,
            "tabletNameReal": tabletNameReal,
            "numberOfTablets": numberOfTablets,
            "remainingTablets": remainingTablets
        ]
    }
}
