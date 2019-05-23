//
//  CameraQRAssembly.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

final class CameraQRAssembly: BaseAssembly {
    
    static func cameraQRPresenterNavigationController(cameraQRDTO: CameraQRDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: cameraQRPresenterView(cameraQRDTO: cameraQRDTO))
        return navigationController
    }
    
    static func cameraQRPresenterView(cameraQRDTO: CameraQRDTO? = nil) -> CameraQRView {
        let view = CameraQRView(nibName: MedicControlUtils.getXib(xibFile: .cameraQRView), bundle: nil)
        view.presenter = cameraQRPresenter(view: view)
        view.presenter?.cameraQRDTO = cameraQRDTO
        return view
    }
    
    static fileprivate func cameraQRPresenter(view: CameraQRView) -> CameraQRPresenterProtocol {
        let presenter = CameraQRPresenter(view: view)
        presenter.router = cameraQRRouter(presenter: presenter, view: view)
        presenter.interactor = cameraQRInteractor(presenter: presenter)
        return presenter
    }
    
    static fileprivate func cameraQRRouter(presenter: CameraQRPresenter, view: CameraQRView) -> CameraQRRouterProtocol {
        let router = CameraQRRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func cameraQRInteractor(presenter: CameraQRPresenterProtocol) -> CameraQRInteractorProtocol {
        let interactor = CameraQRInteractor(presenter: presenter)
        return interactor
    }
}
