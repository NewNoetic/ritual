//
//  AppDelegate.swift
//  ritual
//
//  Created by sg on 7/29/21.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Migration.run()
        return true
    }
}
