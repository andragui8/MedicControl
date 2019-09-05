//
//  NewsDetailAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class NewsDetailAssembly: BaseAssembly {
    
    static func newsDetailPresenterNavigationController(newsDetailDTO: NewsDetailDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: newsDetailPresenterView(newsDetailDTO: newsDetailDTO))
        return navigationController
    }
    
    static func newsDetailPresenterView(newsDetailDTO: NewsDetailDTO? = nil) -> NewsDetailView {
        let view = NewsDetailView(nibName: MedicControlUtils.getXib(xibFile: .newsDetailView), bundle: nil)
        view.presenter = newsDetailPresenter(view: view)
        view.presenter?.newsDetailDTO = newsDetailDTO
        return view
    }
    
    static fileprivate func newsDetailPresenter(view: NewsDetailView) -> NewsDetailPresenterProtocol {
        let presenter = NewsDetailPresenter(view: view)
        presenter.router = newsDetailRouter(presenter: presenter, view: view)
        presenter.interactor = newsDetailInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func newsDetailRouter(presenter: NewsDetailPresenter, view: NewsDetailView) -> NewsDetailRouterProtocol {
        let router = NewsDetailRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func newsDetailInteractor(presenter: NewsDetailPresenterProtocol) -> NewsDetailInteractorProtocol {
        let interactor = NewsDetailInteractor(presenter: presenter)
        return interactor
    }
}
