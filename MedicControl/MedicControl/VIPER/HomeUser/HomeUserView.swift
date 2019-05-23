//
//  HomeUserView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeUserView: BaseView<HomeUserPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var labelUser: UILabel!
    
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    var userName: String?
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.homeUserViewDidLoad()
        self.initializeUI()
        self.i18N()
    }
    
    // MARK: IBActions declaration of all the controls
    @objc func closeSessionButtonTapped() {
        do {
            try Auth.auth().signOut()
            self.presenter?.closeSession()
        } catch (let error) {
            print("Auth sign out failed: \(error)")
        }
    }
    // MARK: Private Functions
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension HomeUserView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Noticias"
        self.labelUser.text = Session.shared.user
    }
    
    func initializeUI() {
        
        let close = UIBarButtonItem(image: #imageLiteral(resourceName: "ico-localizacion"), style: .plain, target: self, action: #selector(self.closeSessionButtonTapped))
            
        self.navigationItem.setRightBarButton(close, animated: true)
    }
}
