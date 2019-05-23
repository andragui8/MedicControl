//
//  LoginInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInteractorProtocol: AnyObject {
    func getLoginData()
}

final class LoginInteractor: BaseInteractor<LoginPresenterProtocol>, LoginInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getLoginData() {
        self.getLoginDataAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getLoginDataAction() {
        
    }
}
