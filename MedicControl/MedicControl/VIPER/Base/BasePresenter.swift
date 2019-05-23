//
//  BasePresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 27/10/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class responsible for referencing all architectural objects.
//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BasePresenter <View: AnyObject, Router: Any, Interactor: Any>: NSObject {
    
    //Declared week for the ARC to destroy them.
    internal weak var view: View?
    internal var router: Router?
    internal var interactor: Interactor?
    
    //Class initializer
    convenience init(view: View, router: Router? = nil, interactor: Interactor? = nil) {
        self.init()
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    deinit {
        print("Desinicializando presenter")
    }
}
