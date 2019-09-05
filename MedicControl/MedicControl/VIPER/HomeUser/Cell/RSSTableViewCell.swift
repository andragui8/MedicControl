//
//  RSSTableViewCell.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 02/09/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import UIKit

class RSSTableViewCell: UITableViewCell {

	@IBOutlet weak var backView: UIView! {
		didSet {
			backView.layer.cornerRadius = 4
			backView.layer.borderWidth = 2
			backView.layer.borderColor = #colorLiteral(red: 0, green: 0.5567334294, blue: 0.001050410792, alpha: 1)
		}
	}
	@IBOutlet weak var titleNews: UILabel!
	@IBOutlet weak var subtitleNewsLabel: UILabel!
	
	var news: NewsModel?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configureCell(news: NewsModel?) {
		self.news = news
		self.clearCell()
		if let newsObj = self.news {
			self.titleNews.text = newsObj.titulo
			self.subtitleNewsLabel.text = newsObj.descripcion
		}
	}
	
	func clearCell() {
		self.titleNews.text = ""
		self.subtitleNewsLabel.text = ""
	}
    
}
