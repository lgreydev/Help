//
//  DeadCode.swift
//  Help
//
//  Created by Sergey Lukaschuk on 02.06.2021.
//

import Foundation


// MARK: Dead Code
/// Do not leave unnecessary comments (default), empty methods or dead functionality - it makes code dirty. Attention to the AppDelegate class, most likely you will find empty methods there with comments inside.

/*
❌ NOT Preferred

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
//
//    func someFunc() {
//        print("Some")
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain
        //types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits
        //the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }


✅ Preferred

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
            return true
    }

}
*/
