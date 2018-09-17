//
//  AppDelegate.swift
//  goal
//
//  Created by 開発 on 2018/09/02.
//  Copyright © 2018年 Kronos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // ハロウィンカラー
        let green_halloween = UIColor(red: 0.122, green: 0.290, blue: 0.031, alpha: 1.0)
        let orange_halloween = UIColor(red: 0.945, green: 0.478, blue: 0.247, alpha: 1.0)

        // ナビゲーションアイテムの色変更
        UINavigationBar.appearance().tintColor = green_halloween
        // ナビゲーションバーの色変更
        UINavigationBar.appearance().barTintColor = orange_halloween
        
        // TopViewControllerを生成する.
        let topViewController: TopViewController = TopViewController()

        // topViewControllerをrootviewに設定し、Navication Controllerを生成する.
        let navigationController: UINavigationController = UINavigationController(rootViewController: topViewController)
        
        // rootViewControllerにNavigationControllerを設定する.
        self.window?.rootViewController = navigationController
        
        // NavigationControllerを表示する.
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

