//
//  MedicinesDetailPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesDetailPresenterProtocol: AnyObject {
    var medicinesDetailDTO: MedicinesDetailDTO? { get set }
    func medicinesDetailViewDidLoad()
    func addMedicine()
}

final class MedicinesDetailPresenter: BasePresenter<MedicinesDetailView, MedicinesDetailRouterProtocol, MedicinesDetailInteractorProtocol>, MedicinesDetailPresenterProtocol {
    var medicinesDetailDTO: MedicinesDetailDTO? 
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func medicinesDetailViewDidLoad() {
        self.medicinesDetailViewDidLoadAction()
        self.initiallizeDetailView()
    }
    
    internal func addMedicine() {
        self.addMedicineAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func medicinesDetailViewDidLoadAction() {
        
    }
    
    fileprivate func initiallizeDetailView() {
        self.view?.labelName.text = self.medicinesDetailDTO?.medicineModel?.name
        self.view?.labelComposition.text = "Composición: \(self.medicinesDetailDTO?.medicineModel?.composition ?? "")"
        self.view?.labelContraindications.text = "Contraindicaciones: \(self.medicinesDetailDTO?.medicineModel?.contraindications ?? "")"
        self.view?.labelIndications.text = "Indicaciones: \(self.medicinesDetailDTO?.medicineModel?.indications ?? "")"
        self.view?.labelOverdosing.text = "Sobredosificación: \( self.medicinesDetailDTO?.medicineModel?.overdosing ?? "")"

    }
    
    fileprivate func addMedicineAction() {
        let dto = MedicineUserInsertServiceDTO.init(userName: Session.shared.user,
                                                    tabletNameKey: self.medicinesDetailDTO?.medicineModel?.key ?? "",
                                                    tabletNameReal: self.medicinesDetailDTO?.medicineModel?.name ?? "",
                                                    numberOfTablets: 20, remainingTablets: 28)
        self.interactor?.addMedicineToUser(dto: dto)
    }
    
    deinit {
        print("Borrando MedicinesDetailPresenter")
    }
}
