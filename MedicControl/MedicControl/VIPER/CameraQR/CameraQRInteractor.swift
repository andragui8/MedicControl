//
//  CameraQRInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol CameraQRInteractorProtocol: AnyObject {
    func getCameraQRData()
    func getMedicines(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void)
}

final class CameraQRInteractor: BaseInteractor<CameraQRPresenterProtocol>, CameraQRInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getCameraQRData() {
        self.getCameraQRDataAction()
    }
    
    internal func getMedicines(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void) {
        self.getMedicinesAction(dto: dto, success: success)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getCameraQRDataAction() {
        
    }
    
    fileprivate func getMedicinesAction(dto: MedicinesGetServiceDTO, success: @escaping ([MedicineModel]) -> Void) {
        let provider = MedicinesProvider()
        provider.getMedicines(dto: dto, success: success, failure: { error in
            print(error)
        })
    }
}
