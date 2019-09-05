//
//  NewsDetailRouter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailRouterProtocol: AnyObject {
    func presentDetailView()
}

final class NewsDetailRouter: BaseRouter<NewsDetailPresenterProtocol, NewsDetailView>, NewsDetailRouterProtocol {
	
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func presentDetailView() {
        
    }

}
