//
//  HomeUserAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class HomeUserAssembly: BaseAssembly {
    
    static func homeUserPresenterNavigationController(homeUserDTO: HomeUserDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: homeUserPresenterView(homeUserDTO: homeUserDTO))
        return navigationController
    }
    
    static func homeUserPresenterView(homeUserDTO: HomeUserDTO? = nil) -> HomeUserView {
        let view = HomeUserView(nibName: MedicControlUtils.getXib(xibFile: .homeUserView), bundle: nil)
        view.presenter = homeUserPresenter(view: view)
        view.presenter?.homeUserDTO = homeUserDTO
        return view
    }
    
    static fileprivate func homeUserPresenter(view: HomeUserView) -> HomeUserPresenterProtocol {
        let presenter = HomeUserPresenter(view: view)
        presenter.router = homeUserRouter(presenter: presenter, view: view)
        presenter.interactor = homeUserInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func homeUserRouter(presenter: HomeUserPresenter, view: HomeUserView) -> HomeUserRouterProtocol {
        let router = HomeUserRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func homeUserInteractor(presenter: HomeUserPresenterProtocol) -> HomeUserInteractorProtocol {
        let interactor = HomeUserInteractor(presenter: presenter)
        return interactor
    }
}
