//
//  MedicinesTableViewCell.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 02/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import UIKit

class MedicinesTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var labelTitleMedicine: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var medicine: MedicinesUserModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.layer.cornerRadius = 4
        MedicControlUtils.applyShadow(view: self.containerView)
    }
    
    func configureCell(medicine: MedicinesUserModel?) {
        self.medicine = medicine
        self.clearCell()
        self.imageViewCell.image = #imageLiteral(resourceName: "ico-pastilla")
        self.labelTitleMedicine.text = self.medicine?.tabletNameReal
        self.labelDescription.text = "300 mg cada comprimido"
        
    }
    
    func clearCell() {
        self.imageViewCell.image = nil
        self.labelTitleMedicine.text = ""
        self.labelDescription.text = ""
    }
    
}
