//
//  LoginRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    func presentDetailView()
    func goToTabBarController()
}

final class LoginRouter: BaseRouter<LoginPresenterProtocol, LoginView>, LoginRouterProtocol {
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
    
    internal func goToHomeUser() {
        let homeUserDTO = HomeUserDTO()
        self.view?.navigationController?.pushViewController(HomeUserAssembly.homeUserPresenterView(homeUserDTO: homeUserDTO), animated: true)
    }
    
    func goToTabBarController() {
        //var window : UIWindow? = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = TabBarViewController()
        self.view?.navigationController?.pushViewController(tabBarController.instantiateTabBar(), animated: true)
        
        //window?.makeKeyAndVisible()
    }

}
