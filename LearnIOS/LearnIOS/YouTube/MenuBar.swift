//
//  MenuBar.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class MenuBar: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
   

   lazy var  collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50), collectionViewLayout: layout)
            cv.isScrollEnabled = false
            cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
            cv.dataSource = self
            cv.delegate = self
        return cv
    }()
    
 
    let menuCellReuseIdentifier = "MenuCellId"
    let images = [ R.image.home.name,R.image.trending.name,R.image.subscriptions.name,R.image.account.name]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.collectionView.register(MenuCell.self, forCellWithReuseIdentifier: menuCellReuseIdentifier)
        setupLayoutUI()
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .init(rawValue: 0))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(collectionView)
    }
    func setupLayoutUI(){
        setupViews()
        setupCollectionViewConstraints()
    }
    func setupCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellReuseIdentifier, for: indexPath) as! MenuCell
        cell.imageView.image =  UIImage(named: images[indexPath.row])?.withRenderingMode(.alwaysTemplate)
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
