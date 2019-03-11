//
//  AppDelegate.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

     //   let pageVC = ProjectPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    //    openEntryListVC()
        application.statusBarStyle = .lightContent
        openQuestionVC()
        // window?.rootViewController = UINavigationController(rootViewController: customController)
      //  window?.rootViewController = CaursolVC()
  
        return true
    }
    func todoListVC() {
        let flowLayout = UICollectionViewLayout()
        let toDoListVC = ToDoListVC(collectionViewLayout: flowLayout)
        window?.rootViewController = UINavigationController(rootViewController: toDoListVC)

    }
    func openEntryListVC(){
        let flowLayout = UICollectionViewLayout()
        let entryListVC = EntryListVC(collectionViewLayout: flowLayout)
        window?.rootViewController = UINavigationController(rootViewController: entryListVC)
    }
    func openQuestionVC(){
        let vc = QuestionController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        UINavigationBar.appearance().barTintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

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

