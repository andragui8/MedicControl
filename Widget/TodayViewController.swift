//
//  TodayViewController.swift
//  Widget
//
//  Created by Andrés Aguirre on 19/11/2018.
//  Copyright © 2018 Andres Aguirre Juarez. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var buttonHiperHappy: UIButton!
    @IBOutlet weak var buttonHappy: UIButton!
    @IBOutlet weak var buttonSad: UIButton!
    @IBOutlet weak var buttonHiperSad: UIButton!
    @IBOutlet weak var viewAnswer: UIView!
    
    private let keyAppGroupName = "group.es.MedicControl"
    private var sharedContainer: UserDefaults?
    
    var reactions: [Double] = []
    var dateForReaction: [Double] = []
    var reactionsDictionary: Dictionary = [Double: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sharedContainer = UserDefaults(suiteName: keyAppGroupName)
        
        self.buttonHappy.setImage(#imageLiteral(resourceName: "ico-pastilla"), for: .highlighted)
        self.buttonHappy.setImage(#imageLiteral(resourceName: "ico-mapa"), for: .selected)
        self.buttonHappy.setImage(#imageLiteral(resourceName: "ico-pastilla"), for: .focused)
        
        // Do any additional setup after loading the view from its nib.
        self.sharedContainer = UserDefaults(suiteName: keyAppGroupName)
        self.loadReactions()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func buttonHiperHappyPressed(_ sender: Any) {
        print("HiperHappy")
        self.changeView()
        self.insertReactionAction(input: 10)
    }
    @IBAction func buttonHappyPressed(_ sender: Any) {
        print("Happy")
        self.changeView()
        self.insertReactionAction(input: 6.6)
    }
    @IBAction func buttonSadPressed(_ sender: Any) {
        print("Sad")
        self.changeView()
        self.insertReactionAction(input: 3.3)
    }
    @IBAction func buttonHiperSadPressed(_ sender: Any) {
        print("HiperSad")
        self.changeView()
        self.insertReactionAction(input: 0)
    }
    
    func changeView() {
        self.viewAnswer.isHidden = false
        self.buttonHiperHappy.isHidden = true
        self.buttonHappy.isHidden = true
        self.buttonSad.isHidden = true
        self.buttonHiperSad.isHidden = true
    }
    
    fileprivate func insertReactionAction(input: Double) {
        let date = Date()
        
        let timeInterval = date.timeIntervalSince1970
        // Redondeamos el intervalo para añadir solo los minutos.
        
        var timeIntervalRounded = Int(timeInterval / 20)
        timeIntervalRounded *= 20
        print(timeIntervalRounded)
        let timeIntervalRoundedDouble = Double(timeIntervalRounded)
        
        self.reactions.append(input)
        self.dateForReaction.append(timeIntervalRoundedDouble)
        
        self.saveReaction()

    }
    
    func saveReaction() {
        self.sharedContainer?.set(self.reactions, forKey: "reactions")
        self.sharedContainer?.set(self.dateForReaction, forKey: "dateForReaction")
        print(self.reactions)
    }
    
    func loadReactions() {
        self.reactions = self.sharedContainer?.array(forKey: "reactions") as? [Double] ?? [Double]()
        self.dateForReaction = self.sharedContainer?.array(forKey: "dateForReaction") as? [Double] ?? [Double]()
    }
}
