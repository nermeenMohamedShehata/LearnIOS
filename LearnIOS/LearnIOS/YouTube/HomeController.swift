//
//  HomeController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController ,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate{

    
    var videos : [Video]?

    var collectionViewHeight : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
       
        // Do any additional setup after loading the view.
        fetchVideos()
        setupViews()
        let swipLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipAction(_:)))
        swipLeft.direction = .left
        self.view.addGestureRecognizer(swipLeft)
        let swipRight = UISwipeGestureRecognizer(target: self, action: #selector(swipAction(_:)))
        swipRight.direction = .right
        self.view.addGestureRecognizer(swipRight)
    }
    var selectedCountryIndex = 0
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    @objc func swipAction(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left{
            if selectedCountryIndex < 4 - 1{
                selectedCountryIndex += 1
            }
        }else{
            if selectedCountryIndex > 0{
                selectedCountryIndex -= 1
            }
        }
        selectedIndexPath = IndexPath(item: selectedCountryIndex, section: 0)
        self.collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
    }
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }

    func setupViews(){
       
        // Add `coolectionView` to display hierarchy and setup its appearance
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.alwaysBounceVertical = true
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .always
        } else {
            // Fallback on earlier versions
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        // Register cell classes
        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
        collectionViewHeight = collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
 
       
        //navigation bar
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
        
       
        // Setup Autolayout constraints
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        menuBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true

        setupMenuBar()
        
 
        setupNavBarButtons()
     }
    let menuBar : MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: redView)
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:[v0]", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
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
