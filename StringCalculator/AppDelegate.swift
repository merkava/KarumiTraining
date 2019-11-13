//
//  AppDelegate.swift
//  StringCalculator
//
//  Created by Marcos on 11/12/19.
//  Copyright © 2019 Mobgen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }

}

