//
//  MapProvider.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 01/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

protocol MapProviderProtocol {
    func insertPharmacy(dto: PharmacyInsertServiceDTO, success: @escaping(String?) -> Void, failure: @escaping(NSError) -> Void)
    func getPharmacies(dto: PharmacyGetServiceDTO, success: @escaping ([PharmacyModel]) -> Void, failure: @escaping (NSError) -> Void)
}

class MapProvider: BaseProvider, MapProviderProtocol {
    func insertPharmacy(dto: PharmacyInsertServiceDTO, success: @escaping (String?) -> Void, failure: @escaping (NSError) -> Void) {
        
        guard let ref = self.getReferenceForPharmacies() else {
            failure(NSError())
            return
        }
        
        let pharmacyItem = PharmacyModel(name: dto.name, open: true, latitude: dto.latitude, longitude: dto.longitude)
        //Añadimos un hijo con el nombre de la farmacia
        let pharmacyItemRef = ref.child(dto.name.lowercased())
        
        pharmacyItemRef.setValue(pharmacyItem.toAnyObject())
        success("Se ha añadido una farmacia a la lista")
    }
    
    func getPharmacies(dto: PharmacyGetServiceDTO, success: @escaping ([PharmacyModel]) -> Void, failure: @escaping (NSError) -> Void) {
        guard let ref = self.getReferenceForPharmacies() else {
            failure(NSError())
            return
        }

        ref.observe(.value, with: { snapshot in
            var pharmacies: [PharmacyModel] = []
            
            for child in snapshot.children {
                // Creamos cada farmacia a partir de su Snaphot
                if let snapshot = child as? DataSnapshot,
                    let pharmacyItem = PharmacyModel(snapshot: snapshot) {
                    pharmacies.append(pharmacyItem)
                }
            }
            success(pharmacies)
        })
    }
}

struct PharmacyInsertServiceDTO {
    let name: String
    let latitude: Double
    let longitude: Double
}

struct PharmacyGetServiceDTO {
    let open: Bool? = nil
}
