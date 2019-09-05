//
//  HomeUserPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol HomeUserPresenterProtocol: AnyObject {
    var homeUserDTO: HomeUserDTO? { get set }
	var newsObject: [NewsModel]? { get set }
    func homeUserViewDidLoad()
    func closeSession()
	func goToNewsDetail(row: Int)
}

final class HomeUserPresenter: BasePresenter<HomeUserView, HomeUserRouterProtocol, HomeUserInteractorProtocol>, HomeUserPresenterProtocol {
    var homeUserDTO: HomeUserDTO?
	var newsObject: [NewsModel]?
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func homeUserViewDidLoad() {
        self.homeUserViewDidLoadAction()
    }
    
    internal func closeSession() {
        self.closeSessionAction()
    }
	
	internal func goToNewsDetail(row: Int) {
		self.goToNewsDetailAction(row: row)
	}
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func homeUserViewDidLoadAction() {
		self.interactor?.getNews(success: { response in
			self.newsObject?.removeAll()
			self.newsObject = [NewsModel]()
			for new in response {
				self.newsObject?.append(new)
			}
			self.view?.tableView.reloadData()
		})
    }
    
    fileprivate func closeSessionAction() {
        self.router?.closeSession()
    }
	
	fileprivate func goToNewsDetailAction(row: Int) {
		let newsDto = NewsDetailDTO(title: self.newsObject?[row].titulo,
									text: self.newsObject?[row].texto)
		self.router?.goToNewDetail(dto: newsDto)
	}
}
