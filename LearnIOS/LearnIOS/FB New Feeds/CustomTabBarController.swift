//
//  CustomTabBarController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let flowLayout = UICollectionViewLayout()
        let vc = FeedController(collectionViewLayout: flowLayout)
        
        let feedNavController = UINavigationController(rootViewController: vc)
        feedNavController.title = "Feed"
        feedNavController.tabBarItem.image =  R.image.news_feed_icon()
        
        let friendsRequestController = UIViewController()
        friendsRequestController.navigationItem.title = "Friend Requests"
        let friendsNavController = UINavigationController(rootViewController: friendsRequestController)
        friendsNavController.title = "Requests"
        friendsNavController.tabBarItem.image = R.image.requests_icon()
        
        let massengerController = UIViewController()
        massengerController.navigationItem.title = "Massenger"
        let massengerNavController = UINavigationController(rootViewController: massengerController)
        massengerNavController.title = "Massenger"
        massengerNavController.tabBarItem.image = R.image.messenger_icon()
        
        let moreController = UIViewController()
        moreController.navigationItem.title = "Massenger"
        let moreNavController = UINavigationController(rootViewController: moreController)
        moreNavController.title = "More"
        moreNavController.tabBarItem.image = R.image.more_icon()
        // Do any additional setup after loading the view.
        viewControllers = [feedNavController,friendsNavController,massengerNavController,moreNavController]
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
