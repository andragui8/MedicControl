//
//  TabBarViewController.swift
//  MedicControlLOC
//
//  Created by Andrés Aguirre on 29/03/2019.
//  Copyright © 2019 Andres Aguirre Juarez. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var firstTabNavigationController: UINavigationController!
    var secondTabNavigationControoller: UINavigationController!
    var thirdTabNavigationController: UINavigationController!
    var fourthTabNavigationControoller: UINavigationController!
    var fifthTabNavigationController: UINavigationController!
    
    internal var tabBarViewController: UITabBarController?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    open func instantiateTabBar() -> UITabBarController {
        
        self.tabBarViewController = UITabBarController()
        
        firstTabNavigationController = MedicinesAssembly.medicinesPresenterNavigationController()
        secondTabNavigationControoller = ChartAssembly.chartPresenterNavigationController()
        thirdTabNavigationController = HomeUserAssembly.homeUserPresenterNavigationController()
        fourthTabNavigationControoller = MapAssembly.mapPresenterNavigationController()
//        fifthTabNavigationController = HomeUserAssembly.homeUserPresenterNavigationController()
        
        self.tabBarViewController?.viewControllers = [firstTabNavigationController,
                                            secondTabNavigationControoller,
                                            thirdTabNavigationController,
                                            fourthTabNavigationControoller]
        
        let item1 = UITabBarItem(title: "Botiquín", image: #imageLiteral(resourceName: "ico-pastilla"), tag: 0)
        let item2 = UITabBarItem(title: "Estado de ánimo", image: #imageLiteral(resourceName: "ico-grafico"), tag: 1)
        let item3 = UITabBarItem(title: "Noticias", image: #imageLiteral(resourceName: "ico-news"), tag: 2)
        let item4 = UITabBarItem(title: "Mapa", image: #imageLiteral(resourceName: "ico-mapa"), tag: 3)
//        let item5 = UITabBarItem(title: "Chat", image: #imageLiteral(resourceName: "ico-chat"), tag: 4)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        thirdTabNavigationController.tabBarItem = item3
        fourthTabNavigationControoller.tabBarItem = item4
//        fifthTabNavigationController.tabBarItem = item5
        
        UITabBar.appearance().tintColor = UIColor(red: 0 / 255.0, green: 146 / 255.0, blue: 248 / 255.0, alpha: 1.0)
        
        tabBarViewController?.selectedIndex = 2
        
        return self.tabBarViewController ?? UITabBarController()
        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
}
