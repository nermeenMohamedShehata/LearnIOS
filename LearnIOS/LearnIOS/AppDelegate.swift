//
//  AppDelegate.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var shardApplication : UIApplication?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        application.statusBarStyle = .lightContent
        UITabBar.appearance().tintColor = UIColor.rgb(red: 70, green: 146, blue: 250)
        //    openEntryListVC()
        //        openQuestionVC()
        // L102Localizer.DoTheMagic()
        
       // openFBNewFeedsVC()
        //        openCustomTabBar()
        shardApplication = application
       // openYouTubeHome()
       // openYoutubeHome2()

        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)


        let flowLayout = UICollectionViewFlowLayout()
        let vc = HomeController(collectionViewLayout: flowLayout)
        let navController = CustomNavigationController(rootViewController: vc)

        window?.rootViewController = navController

        UINavigationBar.appearance().barTintColor =
            UIColor.rgb(red: 230, green: 32, blue: 31)

        //        application.statusBarStyle = .lightContent

        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)

        window?.addSubview(statusBarBackgroundView)
        window?.addConstraintsWithFormat("H:|[v0]|", views: statusBarBackgroundView)

        let height = application.statusBarFrame.height
        window?.addConstraintsWithFormat("V:|[v0(\(height))]", views: statusBarBackgroundView)
        return true
    }
    func openCaurslPage(){
        //   let pageVC = ProjectPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
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
    func openFBNewFeedsVC(){
        let flowLayout = UICollectionViewLayout()
        let vc = FeedController(collectionViewLayout: flowLayout)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        UINavigationBar.appearance().barTintColor = UIColor(red: 51/255, green: 90/255, blue: 145/255, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    func openCustomTabBar(){
        window?.rootViewController = CustomTabBarController()
        
    }
    /*
     YouTube App
     */
    open func openYouTubeHome(){
        let flowLayout = UICollectionViewFlowLayout()
        let vc = HomeController(collectionViewLayout: flowLayout)
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
        UINavigationBar.appearance().barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        
        window?.addSubview(statusBarBackgroundView)
        window?.addConstraintsWithFormat("H:|[v0]|",views:statusBarBackgroundView)
        window?.addConstraints([
            statusBarBackgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            statusBarBackgroundView.heightAnchor.constraint(equalToConstant: 20),
            ])
        window?.addConstraintsWithFormat("V:|[v0(20)]",views:statusBarBackgroundView)
        
        let height = shardApplication?.statusBarFrame.height ?? 0
                window?.addConstraintsWithFormat("V:|[v0(\(height))]", views: statusBarBackgroundView)
        
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

