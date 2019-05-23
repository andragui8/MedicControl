//
//  MapAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 31/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class MapAssembly: BaseAssembly {
    
    static func mapPresenterNavigationController(mapDTO: MapDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: mapPresenterView(mapDTO: mapDTO))
        return navigationController
    }
    
    static func mapPresenterView(mapDTO: MapDTO? = nil) -> MapView {
        let view = MapView(nibName: MedicControlUtils.getXib(xibFile: .mapView), bundle: nil)
        view.presenter = mapPresenter(view: view)
        view.presenter?.mapDTO = mapDTO
        return view
    }
    
    static fileprivate func mapPresenter(view: MapView) -> MapPresenterProtocol {
        let presenter = MapPresenter(view: view)
        presenter.router = mapRouter(presenter: presenter, view: view)
        presenter.interactor = mapInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func mapRouter(presenter: MapPresenter, view: MapView) -> MapRouterProtocol {
        let router = MapRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func mapInteractor(presenter: MapPresenterProtocol) -> MapInteractorProtocol {
        let interactor = MapInteractor(presenter: presenter)
        return interactor
    }
}
