//
//  NewsDetailPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailPresenterProtocol: AnyObject {
    var newsDetailDTO: NewsDetailDTO? { get set }
    func newsDetailViewDidLoad()
}

final class NewsDetailPresenter: BasePresenter<NewsDetailView, NewsDetailRouterProtocol, NewsDetailInteractorProtocol>, NewsDetailPresenterProtocol {
    var newsDetailDTO: NewsDetailDTO? 
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func newsDetailViewDidLoad() {
        self.newsDetailViewDidLoadAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func newsDetailViewDidLoadAction() {
        self.view?.textNewsLabel.text = newsDetailDTO?.text
		self.view?.titleNewsLabel.text = newsDetailDTO?.title
    }
}
