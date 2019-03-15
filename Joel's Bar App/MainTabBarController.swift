//
//  MainTabBarController.swift
//  Joel's Bar App
//
//  Created by Elliot Lawrence on 26/02/2019.
//  Copyright © 2019 Elliot Lawrence. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNavController = createController(viewController: HomeViewController(), imageName: "homeicon")
        let scheduleNavController = createController(viewController: ScheduleViewController(), imageName: "scheduleicon")
        let faqNavController = createController(viewController: FaqViewController(), imageName: "faqicon")
        let menuNavController = createController(viewController: MenuViewController(), imageName: "menuicon")
        
        viewControllers = [homeNavController, scheduleNavController, faqNavController, menuNavController]
    }
    
    func createController(viewController: UIViewController, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        navController.navigationBar.tintColor = .black
        
        return navController
    }
}
