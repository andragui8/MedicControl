//
//  MedicinesDetailRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesDetailRouterProtocol: AnyObject {
    func presentDetailView()
}

final class MedicinesDetailRouter: BaseRouter<MedicinesDetailPresenterProtocol, MedicinesDetailView>, MedicinesDetailRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
    
    deinit {
         print("Borrando MedicinesDetailRouter")
    }
}
