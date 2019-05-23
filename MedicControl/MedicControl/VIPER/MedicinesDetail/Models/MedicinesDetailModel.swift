//
//  MedicinesDetailModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of MedicinesDetail
class MedicinesDetailModel {
    var idMedicinesDetail: String?
    init() {}

}

//extension to initialize the model MedicinesDetail from its struct
extension MedicinesDetailModel {
    convenience init(medicinesDetailModelEntity: MedicinesDetailModelEntity) {
        self.init()
        self.idMedicinesDetail = medicinesDetailModelEntity.idMedicinesDetail
    }
}
