//
//  NewsDetailView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailView: BaseView<NewsDetailPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
	@IBOutlet weak var titleNewsLabel: UILabel!
	
	@IBOutlet weak var textNewsLabel: UILabel!
	// MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
		
		self.presenter?.newsDetailViewDidLoad()
    }
    
    // MARK: IBActions declaration of all the controls
    
    // MARK: Private Functions
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension NewsDetailView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Detalle"
    }
    
    func initializeUI() {
        
    }
}
