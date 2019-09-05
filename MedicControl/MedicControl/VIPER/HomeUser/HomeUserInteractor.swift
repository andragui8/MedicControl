//
//  HomeUserInteractor.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 20/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol HomeUserInteractorProtocol: AnyObject {
	func getNews(success: @escaping ([NewsModel]) -> Void)
}

final class HomeUserInteractor: BaseInteractor<HomeUserPresenterProtocol>, HomeUserInteractorProtocol {
    // MARK: Internal functions declaration of all functions and protocol variables
	
	internal func getNews(success: @escaping ([NewsModel]) -> Void) {
		self.getNewsAction(success: success)
	}
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
	
	fileprivate func getNewsAction(success: @escaping ([NewsModel]) -> Void) {
		let provider = NewsProvider()
		provider.getNews(success: success, failure: { error in
			print(error)
		})
	}
}
