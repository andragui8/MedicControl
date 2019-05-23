//
//  LoginModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Login
class LoginModel {
    var idLogin: String?
    init() {}

}

//extension to initialize the model Login from its struct
extension LoginModel {
    convenience init(loginModelEntity: LoginModelEntity) {
        self.init()
        self.idLogin = loginModelEntity.idLogin
    }
}
