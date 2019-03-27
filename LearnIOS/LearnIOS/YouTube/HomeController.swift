//
//  HomeController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit


class HomeController: UICollectionViewController ,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate{

    
    let titles = ["Home","Trending","subscriptions","Account"]
    let cellId = "cellId"
    let trendingCellId = "trendingCellId"
    let subscriptionCellId = "subscriptionCellId"

     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }


    func setupViews(){
        //navigation bar
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
        
        setupCollectionView()
        attachMenuBarView()
        setupNavBarButtons()
     }
    func setupCollectionView(){
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
 
//        collectionView.alwaysBounceVertical = true
//        if #available(iOS 11.0, *) {
//            collectionView.contentInsetAdjustmentBehavior = .always
//        } else {
//            // Fallback on earlier versions
//        }
//        collectionView.showsHorizontalScrollIndicator = false

        // Register cell classes
        self.collectionView!.register(CustomFeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        collectionView?.register(SubscriptionCell.self, forCellWithReuseIdentifier: subscriptionCellId)
        
        
        collectionView.scrollToItem(at: IndexPath(item: 2, section: 0), at: .bottom, animated: true)
        
 
        
    }
    func setupNavBarButtons(){
        let searchButton = UIBarButtonItem(image: R.image.search_icon()?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapSearch))
        let moreButton = UIBarButtonItem(image: R.image.nav_more_icon()?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapMore))
        self.navigationItem.rightBarButtonItems = [searchButton,moreButton]
    }
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
   @objc func didTapSearch(){
        print("123")
    }
    let blackView = UIView()
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    @objc func didTapMore(){
        settingsLauncher.showsettings()
    }
    func scrollToMenuIndex(menuIndex:Int){
        let indexPath = IndexPath(item: menuIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        
        setTitleForIndex(index: menuIndex)
    }
    private func setTitleForIndex(index:Int){
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "  \(titles[index])"
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String
        if indexPath.item == 1 {
            identifier = trendingCellId
        } else if indexPath.item == 2 {
            identifier = subscriptionCellId
        } else {
            identifier = cellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomFeedCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar?.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
        
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar?.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        setTitleForIndex(index: Int(index))

    }
   
}
/*
extension HomeController{
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.row]
        
        // Configure the cell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightFOrTitleLabel = estimateLabelHeight(index: indexPath.row)
        let height = (view.frame.width - 16 - 16 ) * 9 / 16
        return CGSize(width: self.view.frame.width, height: height + 16 + 8  + heightFOrTitleLabel + 8 + 1 + 8 + 44)
    }
    func estimateLabelHeight(index:Int) -> CGFloat{
        if let title = videos?[index].title {
            let size = CGSize(width: self.view.frame.width - 16 - 44 - 8 - 16, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            if estimatedRect.size.height > 20 {
                return estimatedRect.size.height
                
            } else {
                // titleLabelHeightConstraint?.constant = 20
                return estimatedRect.size.height
            }
        }
        return 0.0
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
*/
