//
//  BaseInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 27/10/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseInteractor <Presenter: Any>: NSObject {
    
    internal var presenter: Presenter?

    //Class initializer
    convenience init(presenter: Presenter? = nil) {
        self.init()
        self.presenter = presenter
    }
    
    deinit {
        print("Destroyed Interactor")
    }
}
