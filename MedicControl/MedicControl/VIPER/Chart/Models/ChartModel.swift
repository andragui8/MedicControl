//
//  ChartModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Chart
class ChartModel {
    var idChart: String?
    init() {}

    deinit {
        print("Borrando objeto de mierda")
    }
}

//extension to initialize the model Chart from its struct
extension ChartModel {
    convenience init(chartModelEntity: ChartModelEntity) {
        self.init()
        self.idChart = chartModelEntity.idChart
    }
}
