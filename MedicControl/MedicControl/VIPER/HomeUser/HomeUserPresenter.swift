//
//  HomeUserPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol HomeUserPresenterProtocol: AnyObject {
    var homeUserDTO: HomeUserDTO? { get set }
    func homeUserViewDidLoad()
    func closeSession()
}

final class HomeUserPresenter: BasePresenter<HomeUserView, HomeUserRouterProtocol, HomeUserInteractorProtocol>, HomeUserPresenterProtocol {
    var homeUserDTO: HomeUserDTO?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func homeUserViewDidLoad() {
        self.homeUserViewDidLoadAction()
    }
    
    internal func closeSession() {
        self.closeSessionAction()
    }
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func homeUserViewDidLoadAction() {

    }
    
    fileprivate func closeSessionAction() {
        self.router?.closeSession()
    }
}
