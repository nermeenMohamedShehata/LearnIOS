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

    var videos : [Video] = {
        var kaneyChanncel = Channel()
        kaneyChanncel.name = "KenyIsTheBestChanncel"
        kaneyChanncel.profileImageName = R.image.kanye_profile.name
        let blankVideo = Video()
        blankVideo.title = "Taylor Swift - Blank Space"
        blankVideo.thumbnailImageName = R.image.taylor_swift_blank_space.name
        blankVideo.channcel = kaneyChanncel
        blankVideo.numberOfViews = 2342453245
        let badVideo = Video()
        badVideo.title = "Taylor Swift - Bad Blood Featuring Keniginj Form Style"
        badVideo.thumbnailImageName = R.image.taylor_swift_bad_blood.name
        badVideo.channcel = kaneyChanncel
        badVideo.numberOfViews = 789687332
        
        let binkyVideo = Video()
        binkyVideo.title = "Taylor Swift - Bad Blood Featuring Keniginj Form Style Taylor Swift - Bad Blood Featuring Keniginj Form Style Taylor Swift - Bad Blood Featuring Keniginj Form Style"
        binkyVideo.thumbnailImageName = R.image.taylor_swift_bad_blood.name
        binkyVideo.channcel = kaneyChanncel
        binkyVideo.numberOfViews = 789687332
        
        return [blankVideo,badVideo,binkyVideo]
    }()
    var collectionViewHeight : NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
       
        // Do any additional setup after loading the view.
        setupViews()


    }
    func setupViews(){
       
        // Add `coolectionView` to display hierarchy and setup its appearance
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.alwaysBounceVertical = true
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        // Register cell classes
        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
        
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

        
        
 
        setupNavBarButtons()
     }
    let menuBar : MenuBar = {
        let menu = MenuBar()
        return menu
    }()
    func setupNavBarButtons(){
        let searchButton = UIBarButtonItem(image: R.image.search_icon()?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapSearch))
        let moreButton = UIBarButtonItem(image: R.image.nav_more_icon()?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapMore))
        
        self.navigationItem.rightBarButtonItems = [searchButton,moreButton]

    }
   @objc func didTapSearch(){
        print("123")
    }
    @objc func didTapMore(){
        print("123")
    }
    
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
       cell.video = videos[indexPath.row]
    
         // Configure the cell
    
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16 ) * 9 / 16
        return CGSize(width: self.view.frame.width, height: height + 16 + 68)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout -
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
//        let referenceHeight: CGFloat = 100 // Approximate height of your cell
//        let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
//            - sectionInset.left
//            - sectionInset.right
//            - collectionView.contentInset.left
//            - collectionView.contentInset.right
//        return CGSize(width: referenceWidth, height: referenceHeight)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
        deinit {
            if let _ = collectionView{
                collectionView.removeObserver(self, forKeyPath: "contentSize")
            }
        }
 
}
// MARK:- Content Adjustment
extension HomeController {
    func setupObservers()  {
        collectionView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {


        if let obj = object as? UICollectionView {
            if obj == self.collectionView && keyPath == "contentSize" {
                if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
                    collectionViewHeight?.constant = newSize.height
                   self.view.layoutIfNeeded()
                }
            }
        }
    }

}

