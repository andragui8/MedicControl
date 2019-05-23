//
//  CameraQRModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of CameraQR
class CameraQRModel {
    var idCameraQR: String?
    init() {}

}

//extension to initialize the model CameraQR from its struct
extension CameraQRModel {
    convenience init(cameraQRModelEntity: CameraQRModelEntity) {
        self.init()
        self.idCameraQR = cameraQRModelEntity.idCameraQR
    }
}
