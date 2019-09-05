//
//  MedicinesDetailView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 03/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

class MedicinesDetailView: BaseView<MedicinesDetailPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelComposition: UILabel!
    @IBOutlet weak var labelContraindications: UILabel!
    @IBOutlet weak var labelIndications: UILabel!
    @IBOutlet weak var labelOverdosing: UILabel!
    
    @IBOutlet weak var buttonAddMedicine: UIButton!
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.medicinesDetailViewDidLoad()
        self.initializeUI()
        self.i18N()
    }
    
    // MARK: IBActions declaration of all the controls
    @IBAction func buttonAddMedicineTapped(_ sender: Any) {
        self.presenter?.addMedicine()
    }
    
    deinit {
        print("Se ha destruido MedicinesDetailView")
        self.presenter = nil
    }
    // MARK: Private Functions
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension MedicinesDetailView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Detalle"
    }
    
    func initializeUI() {
        
    }
}
