//
//  BaseView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 27/10/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class responsible for referencing the view with its presenter.
//Base class, it is declared as a good practice to implement new functions in a global way in the application.
class BaseView<Presenter: Any>: BaseViewController {
    internal var presenter: Presenter?
    
    deinit {
        print("View Destroyed")
        
    }
    
}
