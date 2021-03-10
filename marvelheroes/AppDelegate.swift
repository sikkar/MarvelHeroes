//
//  AppDelegate.swift
//  marvelheroes
//
//  Created by Angel on 7/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeBuilder = HomeBuilder()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeBuilder.build()
        window?.makeKeyAndVisible()
        return true
    }
}

