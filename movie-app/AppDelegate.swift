//
//  AppDelegate.swift
//  movie-app
//
//  Created by Bao Hoang Gia on 07/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared = AppDelegate()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.removeObject(forKey: "auth")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func changeRootView(isLogin: Bool) {
        window = UIWindow(frame: UIScreen.main.bounds)
        switch isLogin {
        case true:
            window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        case false:
            window?.rootViewController = LoginViewController()
        }
        window?.makeKeyAndVisible()
    }
}

