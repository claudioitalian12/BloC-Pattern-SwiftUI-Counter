//
//  AppDelegate.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: CounterView())
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

