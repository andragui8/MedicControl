//
//  MedicinesModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Medicines
class MedicinesModel {
    var idMedicines: String?
    init() {}

}

//extension to initialize the model Medicines from its struct
extension MedicinesModel {
    convenience init(medicinesModelEntity: MedicinesModelEntity) {
        self.init()
        self.idMedicines = medicinesModelEntity.idMedicines
    }
}
