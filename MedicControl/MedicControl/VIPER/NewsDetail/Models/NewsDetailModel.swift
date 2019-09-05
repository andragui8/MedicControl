//
//  NewsDetailModel.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 06/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of NewsDetail
class NewsDetailModel {
    var idNewsDetail: String?
    init() {}

}

//extension to initialize the model NewsDetail from its struct
extension NewsDetailModel {
    convenience init(newsDetailModelEntity: NewsDetailModelEntity) {
        self.init()
        self.idNewsDetail = newsDetailModelEntity.idNewsDetail
    }
}
