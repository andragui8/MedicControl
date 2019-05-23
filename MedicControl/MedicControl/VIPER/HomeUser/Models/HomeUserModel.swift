//
//  HomeUserModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of HomeUser
class HomeUserModel {
    var idHomeUser: String?
    init() {}

}

//extension to initialize the model HomeUser from its struct
extension HomeUserModel {
    convenience init(homeUserModelEntity: HomeUserModelEntity) {
        self.init()
        self.idHomeUser = homeUserModelEntity.idHomeUser
    }
}
