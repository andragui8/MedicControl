//
//  MedicinesDetailInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesDetailInteractorProtocol: AnyObject {
    func getMedicinesDetailData()
    func addMedicineToUser(dto: MedicineUserInsertServiceDTO)
}

final class MedicinesDetailInteractor: BaseInteractor<MedicinesDetailPresenterProtocol>, MedicinesDetailInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getMedicinesDetailData() {
        self.getMedicinesDetailDataAction()
    }
    
    internal func addMedicineToUser(dto: MedicineUserInsertServiceDTO) {
        self.addMedicineToUserAction(dto: dto)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getMedicinesDetailDataAction() {
        
    }
    
    fileprivate func addMedicineToUserAction(dto: MedicineUserInsertServiceDTO) {
        let provider = MedicinesProvider()
        provider.insertMedicineIntoUser(dto: dto, success: { message in
            print(message)
        }, failure: { error in
            print(error)
        })
    }
    
    deinit {
         print("Borrando MedicinesDetailInteractor")
    }
}
