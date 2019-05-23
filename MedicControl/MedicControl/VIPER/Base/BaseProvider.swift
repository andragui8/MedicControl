//
//  BaseProvider.swift
//  BancaMarch
//
//  Created by Andrés Aguirre on 27/10/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

protocol BaseProviderParamsDTO: Encodable {
    
}

extension BaseProviderParamsDTO {
    
    func encode() -> [String: Any] {
        
        guard let jsonData = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            else { return [String: Any]() }
        
        return json ?? [String: Any]()
    }
}

class BaseProvider {
    
    private var manager: DatabaseReference?
    
    private func createManager() -> DatabaseReference? {
        return Database.database().reference()
    }
    
    // MARK: INTERNAL
    
    internal func getManager() -> DatabaseReference? {
        if let manager = manager {
            return manager
        } else {
            return createManager()
        }
    }
    
    internal func getReferenceForPharmacies() -> DatabaseReference? {
        let manager = getManager()
        return manager?.child("pharmacies")
    }
    
    internal func getReferenceForMedicines() -> DatabaseReference? {
        let manager = getManager()
        return manager?.child("medicines")
    }
    
    internal func getReferenceForUserMedicines() -> DatabaseReference? {
        let manager = getManager()
        return manager?.child("user-medicines")
    }
       
}
