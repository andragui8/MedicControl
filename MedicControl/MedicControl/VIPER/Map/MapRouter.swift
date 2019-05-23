//
//  MapRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MapRouterProtocol: AnyObject {
    func presentDetailView()
}

final class MapRouter: BaseRouter<MapPresenterProtocol, MapView>, MapRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
}
