//
//  MedicinesDetailAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class MedicinesDetailAssembly: BaseAssembly {
    
    static func medicinesDetailPresenterNavigationController(medicinesDetailDTO: MedicinesDetailDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: medicinesDetailPresenterView(medicinesDetailDTO: medicinesDetailDTO))
        return navigationController
    }
    
    static func medicinesDetailPresenterView(medicinesDetailDTO: MedicinesDetailDTO? = nil) -> MedicinesDetailView {
        let view = MedicinesDetailView(nibName: MedicControlUtils.getXib(xibFile: .medicinesDetailView), bundle: nil)
        view.presenter = medicinesDetailPresenter(view: view)
        view.presenter?.medicinesDetailDTO = medicinesDetailDTO
        return view
    }
    
    static fileprivate func medicinesDetailPresenter(view: MedicinesDetailView) -> MedicinesDetailPresenterProtocol {
        let presenter = MedicinesDetailPresenter(view: view)
        presenter.router = medicinesDetailRouter(presenter: presenter, view: view)
        presenter.interactor = medicinesDetailInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func medicinesDetailRouter(presenter: MedicinesDetailPresenter, view: MedicinesDetailView) -> MedicinesDetailRouterProtocol {
        let router = MedicinesDetailRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func medicinesDetailInteractor(presenter: MedicinesDetailPresenterProtocol) -> MedicinesDetailInteractorProtocol {
        let interactor = MedicinesDetailInteractor(presenter: presenter)
        return interactor
    }
}
