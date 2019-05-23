//
//  LoginView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 15/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class LoginView: BaseView<LoginPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var constraintLabelUsernameToTop: NSLayoutConstraint!
    @IBOutlet weak var constraintViewContainerBottom: NSLayoutConstraint!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var labelPass: UILabel!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var constraintLabelPassToTop: NSLayoutConstraint!
    
    @IBOutlet weak var buttonAccessLogin: UIButton!
    @IBOutlet weak var buttonRegisterLogin: UIButton!

    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.loginViewDidLoad()
        self.i18N()
        self.initializeUI()
        self.navigationController?.navigationBar.isHidden = true
        self.animationInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.loginViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presenter?.loginViewWillDissappear()
    }
    
    // MARK: IBActions declaration of all the controls
    @IBAction func viewContainerTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func buttonAccessLoginPressed(_ sender: Any) {
        //self.presenter?.goToTabBar()
        guard let email = textFieldUsername.text, let password = textFieldPass.text, email.count > 0, password.count > 0 else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func buttonRegisterLoginPressed(_ sender: Any) {
//        self.presenter?.goToTabBar()
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            // 1
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            // 2 Creamos la cuenta de usuario
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
                if error == nil {
    
                } else {
                    print(error.debugDescription)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private Functions
   fileprivate func animationInit() {
        self.viewContainer.alpha = 0
        self.viewUsername.alpha = 0
        self.textFieldPass.alpha = 0
        self.textFieldUsername.alpha = 0
        self.constraintLabelPassToTop.constant += 22
        self.constraintLabelUsernameToTop.constant += 22
    
        UIView.animate(withDuration: 2.0, animations: {
            self.viewContainer.alpha = 0.5
            self.viewUsername.alpha = 1
            
            self.viewUsername.layoutIfNeeded()
            
        }, completion: { isFinished in
            if isFinished {
                UIView.animate(withDuration: 2.0, animations: {
                    self.constraintLabelPassToTop.constant -= 22
                    self.constraintLabelUsernameToTop.constant -= 22
                    self.textFieldUsername.alpha = 1
                    self.textFieldPass.alpha = 1
                    print("Acabó")
                })
            }
        })
    }
}
// MARK: Extensions declaration of all extension and implementations of protocols 
extension LoginView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Login"
    }
    
    func initializeUI() {
        self.buttonAccessLogin.layer.cornerRadius = 4
        self.buttonRegisterLogin.layer.cornerRadius = 4
        self.buttonRegisterLogin.layer.borderWidth = 2
        self.buttonRegisterLogin.layer.borderColor = MedicControlUtils.getPrimaryColor().cgColor
        self.constraintViewContainerBottom.constant = self.viewBackground.bounds.height - 650
        // 568 = Suma de height de las vistas y constraints de la vista de Login
    }
}
