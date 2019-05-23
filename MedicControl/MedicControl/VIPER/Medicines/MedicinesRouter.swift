//
//  MedicinesRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesRouterProtocol: AnyObject {
    func presentDetailView()
    func pushToCameraQR()
    func pushDetailMedicineView(medicineModel: MedicineModel)
}

final class MedicinesRouter: BaseRouter<MedicinesPresenterProtocol, MedicinesView>, MedicinesRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
    
    internal func pushToCameraQR() {
        self.view?.navigationController?.pushViewController(CameraQRAssembly.cameraQRPresenterView(), animated: true)
    }
    
    internal func pushDetailMedicineView(medicineModel: MedicineModel) {
        let dto = MedicinesDetailDTO.init(medicineModel: medicineModel)
        self.view?.navigationController?.pushViewController(MedicinesDetailAssembly.medicinesDetailPresenterView(medicinesDetailDTO: dto), animated: true)
    }
}
