//
//  CameraQRPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol CameraQRPresenterProtocol: AnyObject {
    var cameraQRDTO: CameraQRDTO? { get set }
    func cameraQRViewDidLoad()
    func saveDataAtFirebase(decodeString: String)
}

final class CameraQRPresenter: BasePresenter<CameraQRView, CameraQRRouterProtocol, CameraQRInteractorProtocol>, CameraQRPresenterProtocol {
    var cameraQRDTO: CameraQRDTO? 
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func cameraQRViewDidLoad() {
        self.cameraQRViewDidLoadAction()
    }
    
    internal func saveDataAtFirebase(decodeString: String) {
        self.saveDataAtFirebaseAction(decodeString: decodeString)
    }
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func cameraQRViewDidLoadAction() {
        
    }
    
    fileprivate func saveDataAtFirebaseAction(decodeString: String) {
        
        let alertPrompt = UIAlertController(title: "Obten información del medicamento", message: "Vas a recolectar la información acerca del medicamento", preferredStyle: .actionSheet)
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { _ -> Void in
            
            let dto = MedicinesGetServiceDTO(name: decodeString)
            self.interactor?.getMedicines(dto: dto, success: { arrayMedicineModel in
                print(arrayMedicineModel)
                if arrayMedicineModel.count > 0 {
                    var dto = MedicinesDetailDTO()
                    dto.medicineModel = arrayMedicineModel.first
                    self.router?.presentMedicineDetail(dto: dto)
                    
                    self.view?.captureSession.stopRunning()
                }
            })
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertPrompt.addAction(confirmAction)
        alertPrompt.addAction(cancelAction)
        
        self.view?.present(alertPrompt, animated: true, completion: nil)
    }
    
    fileprivate func createMedicineObject(decodeString: String) {
        let arrayStrings = decodeString.components(separatedBy: "/")
        
    }
    
}
