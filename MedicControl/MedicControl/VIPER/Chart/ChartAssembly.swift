//
//  ChartAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class ChartAssembly: BaseAssembly {
    
    static func chartPresenterNavigationController(chartDTO: ChartDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: chartPresenterView(chartDTO: chartDTO))
        return navigationController
    }
    
    static func chartPresenterView(chartDTO: ChartDTO? = nil) -> ChartView {
        let view = ChartView(nibName: MedicControlUtils.getXib(xibFile: .chartView), bundle: nil)
        view.presenter = chartPresenter(view: view)
        view.presenter?.chartDTO = chartDTO
        return view
    }
    
    static fileprivate func chartPresenter(view: ChartView) -> ChartPresenterProtocol {
        let presenter = ChartPresenter(view: view)
        presenter.router = chartRouter(presenter: presenter, view: view)
        presenter.interactor = chartInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func chartRouter(presenter: ChartPresenter, view: ChartView) -> ChartRouterProtocol {
        let router = ChartRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func chartInteractor(presenter: ChartPresenterProtocol) -> ChartInteractorProtocol {
        let interactor = ChartInteractor(presenter: presenter)
        return interactor
    }
}
