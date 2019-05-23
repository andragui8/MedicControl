//
//  MapModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Map
class MapModel {
    var idMap: String?
    init() {}

}

//extension to initialize the model Map from its struct
extension MapModel {
    convenience init(mapModelEntity: MapModelEntity) {
        self.init()
        self.idMap = mapModelEntity.idMap
    }
}
