//
//  LoginAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class LoginAssembly: BaseAssembly {
    
    static func loginPresenterNavigationController(loginDTO: LoginDTO? = nil) -> UINavigationController {
        //Deshabilita el gesto de hacer Pop a una vista para que vuelva a la vista del Login
        let navigationController = UINavigationController(rootViewController: loginPresenterView(loginDTO: loginDTO))
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        return navigationController
    }
    
    static func loginPresenterView(loginDTO: LoginDTO? = nil) -> LoginView {
        let view = LoginView(nibName: MedicControlUtils.getXib(xibFile: .loginView), bundle: nil)
        view.presenter = loginPresenter(view: view)
        view.presenter?.loginDTO = loginDTO
        return view
    }
    
    static fileprivate func loginPresenter(view: LoginView) -> LoginPresenterProtocol {
        let presenter = LoginPresenter(view: view)
        presenter.router = loginRouter(presenter: presenter, view: view)
        presenter.interactor = loginInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func loginRouter(presenter: LoginPresenter, view: LoginView) -> LoginRouterProtocol {
        let router = LoginRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func loginInteractor(presenter: LoginPresenterProtocol) -> LoginInteractorProtocol {
        let interactor = LoginInteractor(presenter: presenter)
        return interactor
    }
}
