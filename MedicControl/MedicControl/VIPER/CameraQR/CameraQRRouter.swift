//
//  CameraQRRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol CameraQRRouterProtocol: AnyObject {
    func presentDetailView()
    func presentMedicineDetail(dto: MedicinesDetailDTO)
}

final class CameraQRRouter: BaseRouter<CameraQRPresenterProtocol, CameraQRView>, CameraQRRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
    
    internal func presentMedicineDetail(dto: MedicinesDetailDTO) {
        self.view?.navigationController?.pushViewController(MedicinesDetailAssembly.medicinesDetailPresenterView(medicinesDetailDTO: dto), animated: true)
    }
}
