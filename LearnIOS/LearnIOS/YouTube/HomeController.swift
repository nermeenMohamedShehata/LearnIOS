//
//  HomeController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()

//        if L102Language.currentAppleLanguage() == "ar" {
//            loopThroughSubViewAndFlipTheImageIfItsAUIImageView(subviews: self.view.subviews)
//        }
//        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        setupNavigation()

        // Register cell classes
        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    func setupNavigation(){
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.alwaysBounceVertical = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
        
        let titleButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleButton.setTitle("Home", for: .normal)
       titleButton.setTitleColor(.white, for: .normal)
        navigationItem.titleView = titleButton
        titleButton.addTarget(self, action: #selector(switchLanguage), for: .touchUpInside)
        
     }
    @objc func switchLanguage(){
//
//        var transition: UIView.AnimationOptions = .transitionFlipFromLeft
//        if L102Language.currentAppleLanguage() == "en" {
//            L102Language.setAppleLAnguageTo(lang: "ar")
//            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//        } else {
//            L102Language.setAppleLAnguageTo(lang: "en")
//            transition = .transitionFlipFromRight
//            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//        }
//        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//        let flowLayout = UICollectionViewFlowLayout()
//        let vc = HomeController(collectionViewLayout: flowLayout)
//        let navController = UINavigationController(rootViewController: vc)
//        rootviewcontroller.rootViewController = navController
//        
//        
        
//        rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "rootnav")

//        let mainwindow = (UIApplication.shared.delegate?.window!)!
//        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
//        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
//        }) { (finished) -> Void in
//            
//        }
     }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupMenuBar()
    }
    let menuBar : MenuBar = {
        let menu = MenuBar()
        return menu
    }()
   private func setupMenuBar(){
        view.addSubview(menuBar)
    
    view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
    view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
         // Configure the cell
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16 ) * 9 / 16
        return CGSize(width: self.view.frame.width, height: height + 16 + 68)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 

}
