//
//  MapInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MapInteractorProtocol: AnyObject {
    func getMapData()
    func getFarmacias(success: @escaping ([PharmacyModel]) -> Void)
    func saveItem(name: String?, latitude: Double?, longitude: Double?)
}

final class MapInteractor: BaseInteractor<MapPresenterProtocol>, MapInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getMapData() {
        self.getMapDataAction()
    }
    
    internal func getFarmacias(success: @escaping ([PharmacyModel]) -> Void) {
        self.getFarmaciasAction(success: success)
    }
    
    internal func saveItem(name: String?, latitude: Double?, longitude: Double?) {
        self.saveItemAction(name: name, latitude: latitude, longitude: longitude)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getMapDataAction() {
        
    }
    
    fileprivate func getFarmaciasAction(success: @escaping ([PharmacyModel]) -> Void) {
        let provider = MapProvider()
        provider.getPharmacies(dto: PharmacyGetServiceDTO(), success: success, failure: { error in
            print(error)
        })
    }
    
    fileprivate func saveItemAction(name: String?, latitude: Double?, longitude: Double?) {
        guard let nameItem = name, let latitude = latitude, let longitude = longitude else {
            return
        }
        
        let dto = PharmacyInsertServiceDTO(name: nameItem, latitude: latitude, longitude: longitude)
        let provider = MapProvider()
        provider.insertPharmacy(dto: dto, success: { message in
            print(message)
        }, failure: { error in
            print(error)
        })
    }
}
