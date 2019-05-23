//
//  ChartRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol ChartRouterProtocol: AnyObject {
    func presentDetailView()
}

final class ChartRouter: BaseRouter<ChartPresenterProtocol, ChartView>, ChartRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
}
