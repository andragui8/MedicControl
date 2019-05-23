//
//  MedicinesView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

class MedicinesView: BaseView<MedicinesPresenterProtocol>, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewTransparentAddMedicine: UIView!
    
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.tableView.register(UINib(nibName: "MedicinesTableViewCell", bundle: nil), forCellReuseIdentifier: "MedicinesTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.presenter?.medicinesViewDidLoad()
        
    }
    
    // MARK: IBActions declaration of all the controls
    @objc func addNavigationButtonTapped() {
        self.viewTransparentAddMedicine.isHidden = false
    }
    
    @IBAction func addMedicineQRTapped(_ sender: Any) {
        print("QR pulsado")
        self.viewTransparentAddMedicine.isHidden = true
        self.presenter?.openCamera()
    }
    
    @IBAction func addMedicineTextTapped(_ sender: Any) {
        print("Manual pulsado")
        self.viewTransparentAddMedicine.isHidden = true
        self.presenter?.insertMedicine()
    }
    
    // MARK: Private Functions
    
    // MARK: TableView protocol functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.medicinesFromUser.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicinesTableViewCell", for: indexPath) as? MedicinesTableViewCell
        guard let medicinesCell = cell else {
            return UITableViewCell()
        }
        let medicine = self.presenter?.medicinesFromUser[indexPath.row]
        medicinesCell.configureCell(medicine: medicine ?? nil)
        return medicinesCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 80)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.goToMedicineDetail(index: indexPath.row)
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension MedicinesView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Medicines"
    }
    
    func initializeUI() {
//        self.tableView.backgroundColor = MedicControlUtils.getPrimaryColor()
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNavigationButtonTapped))
        
//        let addMedicineText = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addMedicineTextTapped))
//        let addMedicineQR = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addMedicineQRTapped))
        
        self.navigationItem.setRightBarButton(add, animated: true)
    }
}
