//
//  MedicinesProvider.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import Firebase

protocol NewsProviderProtocol {
	func getNews(success: @escaping ([NewsModel]) -> Void, failure: @escaping (NSError) -> Void)
}

class NewsProvider: BaseProvider, NewsProviderProtocol {
	internal func getNews(success: @escaping ([NewsModel]) -> Void, failure: @escaping (NSError) -> Void) {
		guard let ref = self.getReferenceForNews() else {
			failure(NSError())
			return
		}
		
		ref.observe(.value, with: { snapshot in
			var news: [NewsModel] = []
			
			for child in snapshot.children {
				// Creamos cada farmacia a partir de su Snaphot
				if let snapshot = child as? DataSnapshot,
					let newsItem = NewsModel(snapshot: snapshot) {
					news.append(newsItem)
				}
			}
			success(news)
		})
	}
}
