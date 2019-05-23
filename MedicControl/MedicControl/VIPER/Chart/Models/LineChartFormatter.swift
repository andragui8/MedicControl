//
//  LineChartFormatter.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 21/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import UIKit
import Foundation
import Charts

@objc(BarChartFormatter)
public class LineChartFormatter: NSObject, IAxisValueFormatter {
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        // convert Int to Double
        let timeInterval = Double(value)
        
        // create NSDate from Double (NSTimeInterval)
        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        let result = formatter.string(from: myNSDate)
        
        return result
    }
}
