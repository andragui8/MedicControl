//
//  LoginPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol LoginPresenterProtocol: AnyObject {
    var loginDTO: LoginDTO? { get set }
    func loginViewDidLoad()
    func goToTabBar()
    func loginViewWillDissappear()
    func loginViewWillAppear()
}

final class LoginPresenter: BasePresenter<LoginView, LoginRouterProtocol, LoginInteractorProtocol>, LoginPresenterProtocol {
    
    var loginDTO: LoginDTO? 
    var handle: AuthStateDidChangeListenerHandle?
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func loginViewDidLoad() {
        self.loginViewDidLoadAction()
    }
    
    internal func goToTabBar() {
        self.goToTabBarAction()
    }
    
    internal func loginViewWillDissappear() {
        self.loginViewWillDissappearAction()
    }
    
    internal func loginViewWillAppear() {
        self.loginViewWillAppearAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func loginViewDidLoadAction() {

    }
    
    fileprivate func goToTabBarAction() {
        self.router?.goToTabBarController()
    }
    
    fileprivate func loginViewWillDissappearAction() {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    fileprivate func loginViewWillAppearAction() {
        // 1 Añadimos un observador al comienzo.
        handle = Auth.auth().addStateDidChangeListener() { auth, user in
            // 2 Cuando detecta cambios en un usuario
            // 2.1 Usuario se ha logueado -> Navegamos a la siguiente pantalla
            // 2.2 Usuario ha hecho logout -> Por el momento no hacemos nada
            if user != nil {
                Session.shared.user = user?.uid ?? ""
                self.view?.textFieldUsername.text = nil
                self.view?.textFieldPass.text = nil
                self.view?.view.endEditing(true)
                self.goToTabBar()
            }
        }
    }
}
