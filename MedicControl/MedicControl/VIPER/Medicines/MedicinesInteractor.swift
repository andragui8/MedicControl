//
//  MedicinesInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesInteractorProtocol: AnyObject {
    func getMedicinesData()
    func saveItem(dto: MedicineInsertServiceDTO?)
    func getMedicines(success: @escaping ([MedicineModel]) -> Void)
    func getMedicinesFromUser(success: @escaping ([MedicinesUserModel]) -> Void)
    func getMedicineData(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void)
}

final class MedicinesInteractor: BaseInteractor<MedicinesPresenterProtocol>, MedicinesInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getMedicinesData() {
        self.getMedicinesDataAction()
    }
    
    internal func saveItem(dto: MedicineInsertServiceDTO?) {
        self.saveItemAction(dto: dto)
    }
    
    internal func getMedicines(success: @escaping ([MedicineModel]) -> Void) {
        self.getMedicinesAction(success: success)
    }
    
    internal func getMedicinesFromUser(success: @escaping ([MedicinesUserModel]) -> Void) {
        self.getMedicinesFromUserAction(success: success)
    }
    
    internal func getMedicineData(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void) {
        self.getMedicineDataAction(dto: dto, success: success)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getMedicinesDataAction() {
        
    }
    
    fileprivate func saveItemAction(dto: MedicineInsertServiceDTO?) {
        guard let dto = dto else {
            return
        }
        
        let provider = MedicinesProvider()
        provider.insertMedicine(dto: dto, success: { message in
            print(message ?? "")
        }, failure: { error in
            print(error)
        })
    }
    
    fileprivate func getMedicinesAction(success: @escaping ([MedicineModel]) -> Void) {
        let provider = MedicinesProvider()
        provider.getMedicines(dto: MedicinesGetServiceDTO(name: ""), success: success, failure: { error in
            print(error)
        })
    }
    
    fileprivate func getMedicinesFromUserAction(success: @escaping ([MedicinesUserModel]) -> Void) {
        let provider = MedicinesProvider()
        provider.getMedicinesFromUser(dto: MedicinesUserGetServiceDTO(userName: Session.shared.user), success: success, failure: { error in
            print(error)
        })
    }
    
    fileprivate func getMedicineDataAction(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void) {
        let provider = MedicinesProvider()
        provider.getMedicines(dto: dto, success: success, failure: { error in
            print(error)
        })
    }
}
