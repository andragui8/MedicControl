//
//  HomeUserRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol HomeUserRouterProtocol: AnyObject {
    func presentDetailView()
    func closeSession()
	func goToNewDetail(dto: NewsDetailDTO)
}

final class HomeUserRouter: BaseRouter<HomeUserPresenterProtocol, HomeUserView>, HomeUserRouterProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }
    
    internal func closeSession() {
//        self.view?.navigationController?.popToRootViewController(animated: true)
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
        appDelegate.navigationController?.popToRootViewController(animated: false)
        
    }
	
	internal func goToNewDetail(dto: NewsDetailDTO) {
		self.view?.navigationController?.pushViewController(NewsDetailAssembly.newsDetailPresenterView(newsDetailDTO: dto), animated: true)
	}
}
