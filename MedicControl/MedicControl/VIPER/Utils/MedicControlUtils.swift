//
//  MedicControlUtils.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 27/10/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

class MedicControlUtils {
    static func getXib(xibFile: XibFile) -> String {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return xibFile.rawValue
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            return xibFile.rawValue + "_iPad"
        } else {
            return ""
        }
    }
    
    static func applyShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 2
    }
    
    static func applyShadowAtTop(view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: -0.5, height: -0.5)
        view.layer.shadowRadius = 0.5
    }
    
    static func getPrimaryColor() -> UIColor {
        return UIColor(red: 0.01, green: 0.50, blue: 0.01, alpha: 1.0)
    }
}
