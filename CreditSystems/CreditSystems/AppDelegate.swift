//
//  AppDelegate.swift
//  CreditSystems
//
//  Created by Krasa on 28/12/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let coordinator = CoordinatorAssembly().coordinator


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        coordinator.window = window
        coordinator.start()
        coordinator.flowCompleted = {
            print("наебали!")
        }
        
        return true
    }
}

