//
//  MedicinesPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesPresenterProtocol: AnyObject {
    var medicinesDTO: MedicinesDTO? { get set }
    var medicinesFromUser: [MedicinesUserModel] { get }
    func medicinesViewDidLoad()
    func insertMedicine()
    func openCamera()
    func goToMedicineDetail(index: Int)
}

final class MedicinesPresenter: BasePresenter<MedicinesView, MedicinesRouterProtocol, MedicinesInteractorProtocol>, MedicinesPresenterProtocol {
    var medicinesDTO: MedicinesDTO? 
    var medicinesFromUser: [MedicinesUserModel] = []
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func medicinesViewDidLoad() {
        self.medicinesViewDidLoadAction()
    }
    
    internal func insertMedicine() {
        self.insterMedicineAction()
    }
    
    internal func openCamera() {
        self.openCameraAction()
    }
    
    internal func goToMedicineDetail(index: Int) {
        self.goToMedicineDetailAction(index: index)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func medicinesViewDidLoadAction() {
        self.getMedicinesFromUserAction()
    }
    
    fileprivate func insterMedicineAction() {
        let alert = UIAlertController(title: "Nueva Medicina",
                                      message: "Añade una medicina",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar", style: .default) { _ in
            
            guard let textFields = alert.textFields else { return }
            var tFieldsInput: [String] = []
            for textField in textFields {
                tFieldsInput.append(textField.text ?? "")
            }
            let dto = MedicineInsertServiceDTO(name: tFieldsInput[0], composition: tFieldsInput[1], indications: tFieldsInput[2], posology: tFieldsInput[3], contraindications: tFieldsInput[4], warnings: tFieldsInput[5], precautions: tFieldsInput[6], overdosing: tFieldsInput[7])
            self.interactor?.saveItem(dto: dto)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel)
        
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.view?.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func openCameraAction() {
        self.router?.pushToCameraQR()
    }
    
    fileprivate func getMedicinesFromUserAction() {
        self.interactor?.getMedicinesFromUser(success: { medicines in
            self.medicinesFromUser = medicines
            self.view?.tableView.reloadData()
        })
    }
    
    fileprivate func goToMedicineDetailAction(index: Int) {
        let dto = MedicinesGetServiceDTO.init(name: self.medicinesFromUser[index].key)
        self.interactor?.getMedicineData(dto: dto, success: { medicinesModel in
            if let medicines = medicinesModel.first {
                self.router?.pushDetailMedicineView(medicineModel: medicines)
            }
        })
        
    }
}
