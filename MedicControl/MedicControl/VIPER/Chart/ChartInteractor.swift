//
//  ChartInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol ChartInteractorProtocol: AnyObject {
    func getChartData()
}

final class ChartInteractor: BaseInteractor<ChartPresenterProtocol>, ChartInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getChartData() {
        self.getChartDataAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getChartDataAction() {
        
    }
}
