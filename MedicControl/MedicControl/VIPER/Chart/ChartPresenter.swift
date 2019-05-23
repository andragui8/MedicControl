//
//  ChartPresenter.swift
//  MedicControl
//
//  Created by Andrés Aguirre on 17/04/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import Foundation
import UIKit

protocol ChartPresenterProtocol: AnyObject {
    var chartDTO: ChartDTO? { get set }
    var reactions: [Double] { get set }
    var dateForReaction: [Double] { get set }
    func chartViewDidLoad()
    func insertReaction(input: Double)
}

final class ChartPresenter: BasePresenter<ChartView, ChartRouterProtocol, ChartInteractorProtocol>, ChartPresenterProtocol {
    var chartDTO: ChartDTO? 
    var reactions: [Double] = []
    var dateForReaction: [Double] = []
    
    var reactionsDictionary: Dictionary = [Double: Double]()
    
    private let keyAppGroupName = "group.es.MedicControl"
    private var sharedContainer: UserDefaults?
    
    // MARK: Internal functions declaration of all functions and protocol variables
    internal func chartViewDidLoad() {
        self.chartViewDidLoadAction()
    }
    
    internal func insertReaction(input: Double) {
        self.insertReactionAction(input: input)
    }
    
    // MARK: Fileprivate functions declaration of all functions that return something to the protocol or perform an activity that should not be exposed
    fileprivate func chartViewDidLoadAction() {
        self.sharedContainer = UserDefaults(suiteName: keyAppGroupName)
        self.loadReactionsFromAppGroupsAction()
        self.prepareArraysForChart()
    }
    
    fileprivate func insertReactionAction(input: Double) {
        let date = Date()
        
        let timeInterval = date.timeIntervalSince1970
        // Redondeamos el intervalo para añadir solo los minutos.

        var timeIntervalRounded = Int(timeInterval / 20)
        timeIntervalRounded *= 20
        print(timeIntervalRounded)
        let timeIntervalRoundedDouble = Double(timeIntervalRounded)
        
        self.reactions.append(input) //Añadimos la reacción al array de reacciones
        self.dateForReaction.append(timeIntervalRoundedDouble) //Añadimos la fecha en la que se realizó la reacción
        self.reactionsDictionary[timeIntervalRoundedDouble] = input
        
        self.prepareArraysForChart()
        
        print(reactionsDictionary)
    }
    
    fileprivate func prepareArraysForChart() {
        self.reactions = []
        self.dateForReaction = []
        
        //Mostramos las entradas del diccionario ordenadas por clave, es decir, por timeIntervalSince1970
        for element in self.reactionsDictionary.sorted(by: <) {
            self.reactions.append(element.value)
            self.dateForReaction.append(element.key)
            print(element)
        }
        
        self.view?.updateGraph()
    }
    
    fileprivate func saveReactionAction() {
        let emptyDoubleArray: [Double] = [Double]()
        //Limpiamos las reacciones que teníamos guardadas en User Defaults
        self.sharedContainer?.set(emptyDoubleArray, forKey: "reactions")
        self.sharedContainer?.set(emptyDoubleArray, forKey: "dateForReaction")
    }
    
    fileprivate func loadReactionsFromAppGroupsAction() {
        self.reactions = self.sharedContainer?.array(forKey: "reactions") as? [Double] ?? [Double]()
        self.dateForReaction = self.sharedContainer?.array(forKey: "dateForReaction") as? [Double] ?? [Double]()
        
        for i in 0..<self.reactions.count {
            self.reactionsDictionary[self.dateForReaction[i]] = self.reactions[i]
            print("Iteración: \(i)")
        }
        self.saveReactionAction()
        self.prepareArraysForChart()
    }
    
}
