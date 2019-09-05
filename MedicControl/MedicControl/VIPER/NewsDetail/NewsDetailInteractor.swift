//
//  NewsDetailInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailInteractorProtocol: AnyObject {
    func getNewsDetailData()
}

final class NewsDetailInteractor: BaseInteractor<NewsDetailPresenterProtocol>, NewsDetailInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func getNewsDetailData() {
        self.getNewsDetailDataAction()
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func getNewsDetailDataAction() {
        
    }
}
