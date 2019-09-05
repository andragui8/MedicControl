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

class HomeUserView: BaseView<HomeUserPresenterProtocol>, UITableViewDelegate, UITableViewDataSource  {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var labelUser: UILabel!
	@IBOutlet weak var tableView: UITableView!
	
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    var userName: String?
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.homeUserViewDidLoad()
        self.initializeUI()
        self.i18N()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(UINib(nibName: "RSSTableViewCell", bundle: nil), forCellReuseIdentifier: "RSSTableViewCell")
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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter?.newsObject?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell", for: indexPath) as? RSSTableViewCell
		guard let newsCell = cell else {
			return UITableViewCell()
		}
		newsCell.selectionStyle = .none
		newsCell.configureCell(news: self.presenter?.newsObject?[indexPath.row])
		return newsCell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter?.goToNewsDetail(row: indexPath.row)
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
        
        let close = UIBarButtonItem(image: #imageLiteral(resourceName: "ico-close"), style: .plain, target: self, action: #selector(self.closeSessionButtonTapped))
		close.tintColor = #colorLiteral(red: 0, green: 0.5567334294, blue: 0.001050410792, alpha: 1)
        self.navigationItem.setRightBarButton(close, animated: true)
    }
}
