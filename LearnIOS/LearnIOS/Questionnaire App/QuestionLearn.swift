//
//  QuestionLearn.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/11/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import Foundation

/*
 1- Header for tableView for question
 
    tableView.register(QuestionHeaderCell.self, forHeaderFooterViewReuseIdentifier: headerId)
    tableView.sectionHeaderHeight = 50
    tableView.tableFooterView = UIView()
    override viewForHeaderInSection function
 
 2-    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
 super.init(style: style, reuseIdentifier: reuseIdentifier)
 setupLayout()
 }
 
 3- Custom tabBar in AppDelegate
    - change color for all nav bar in app
        UINavigationBar.appearance().barTintColor = UIColor.orange
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
 
     - self.navigationItem.title = "Results"
 
 4- change back button title
 
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
 
 
 5- Count of viewcontrollers
        self.navigationController?.viewControllers.lastIndex(of: self)
 */
