//
//  ChartView.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartView: BaseView<ChartPresenterProtocol> {
    // MARK: IBOutlets declaration of all controls
    @IBOutlet weak var chartView: LineChartView!
    
    // MARK: Fileprivate Variables all variables must be for internal use, we should only have access to controls from the presenter
    
    // MARK: UIViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.chartViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: IBActions declaration of all the controls
    @IBAction func buttonHappiestPressed(_ sender: Any) {
        self.presenter?.insertReaction(input: 10)
    }
    
    @IBAction func buttonHappyPressed(_ sender: Any) {
        self.presenter?.insertReaction(input: 6.33)
    }
    
    @IBAction func buttonSadPressed(_ sender: Any) {
        self.presenter?.insertReaction(input: 3.3)
    }
    
    @IBAction func buttonillPressed(_ sender: Any) {
        self.presenter?.insertReaction(input: 0)
    }
    // MARK: Private Functions
    func updateGraph() {
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        let lineChartFormat: LineChartFormatter = LineChartFormatter()
        let xAxis: XAxis = XAxis()
        
        let count = self.presenter?.reactions.count

        for i in 0..<count! {
            
            let value = ChartDataEntry(x: self.presenter?.dateForReaction[i] ?? 0, y: self.presenter?.reactions[i] ?? 0) // here we set the X and Y status in a data chart entry
            
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        xAxis.valueFormatter = lineChartFormat
        self.chartView.xAxis.valueFormatter = xAxis.valueFormatter
        
        // En la línea 1 introduciremos los valores del estado de ánimo del usuario.
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Estado de ánimo") //Here we convert lineChartEntry to a LineChartDataSet
        
        line1.colors = [#colorLiteral(red: 0, green: 0.5567334294, blue: 0.001050410792, alpha: 1)] //Coloreamos la linea del color verde característico de la aplicación
        line1.valueFont = UIFont(name: "American Typewriter", size: 0)!
        line1.drawCirclesEnabled = false
        
        //Dibujamos el color del gradiente de la línea 1
        let gradientColors = [#colorLiteral(red: 0, green: 0.5567334294, blue: 0.001050410792, alpha: 1), UIColor.clear.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0]
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else {
            print("gradient error" )
            return
        }
        
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = true
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        //data.setDrawValues(true)
        
        self.chartView.data = data //finally - it adds the chart data to the chart and causes an update
        self.chartView.chartDescription?.text = "Estado de ánimo" // Here we set the description for the graph
        
        self.chartView.xAxis.drawGridLinesEnabled = false
        self.chartView.xAxis.labelRotationAngle = 315
        
        self.chartView.rightAxis.drawGridLinesEnabled = false
        self.chartView.leftAxis.drawGridLinesEnabled = false
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension ChartView: BaseViewControllerRefresh {
    func refresh() {
        
    }
    
    func i18N() {
        self.title = "Emociones"
    }
    
    func initializeUI() {
        
    }
}
