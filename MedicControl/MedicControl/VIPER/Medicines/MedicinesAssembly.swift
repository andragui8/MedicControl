//
//  MedicinesAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class MedicinesAssembly: BaseAssembly {
    
    static func medicinesPresenterNavigationController(medicinesDTO: MedicinesDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: medicinesPresenterView(medicinesDTO: medicinesDTO))
        return navigationController
    }
    
    static func medicinesPresenterView(medicinesDTO: MedicinesDTO? = nil) -> MedicinesView {
        let view = MedicinesView(nibName: MedicControlUtils.getXib(xibFile: .medicinesView), bundle: nil)
        view.presenter = medicinesPresenter(view: view)
        view.presenter?.medicinesDTO = medicinesDTO
        return view
    }
    
    static fileprivate func medicinesPresenter(view: MedicinesView) -> MedicinesPresenterProtocol {
        let presenter = MedicinesPresenter(view: view)
        presenter.router = medicinesRouter(presenter: presenter, view: view)
        presenter.interactor = medicinesInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func medicinesRouter(presenter: MedicinesPresenter, view: MedicinesView) -> MedicinesRouterProtocol {
        let router = MedicinesRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func medicinesInteractor(presenter: MedicinesPresenterProtocol) -> MedicinesInteractorProtocol {
        let interactor = MedicinesInteractor(presenter: presenter)
        return interactor
    }
}
