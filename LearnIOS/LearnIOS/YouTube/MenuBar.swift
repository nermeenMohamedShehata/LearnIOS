//
//  MenuBar.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class MenuBar: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    lazy var horizontalBarView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return view
    }()

    let menuCellReuseIdentifier = "MenuCellId"
 
    let images = [ R.image.home.name,R.image.trending.name,R.image.subscriptions.name,R.image.switch_account.name]

    override init(frame: CGRect) {
        super.init(frame: frame)

        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: menuCellReuseIdentifier)
        setupLayoutUI()

        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
     }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(collectionView)
        addSubview(horizontalBarView)

    }
    func setupLayoutUI(){
        setupViews()
        setupCollectionViewConstraints()
        setupHorizontalBarViewConstraints()
    }
    func setupCollectionViewConstraints(){
                addConstraintsWithFormat("H:|[v0]|", views: collectionView)
                addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        // this not working in top & bottom
        /*
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!),
            collectionView.bottomAnchor.constraint(equalTo:(self.superview?.bottomAnchor)!),
            ])
        */
    }
    func setupHorizontalBarViewConstraints(){
        NSLayoutConstraint.activate([
//            horizontalBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            horizontalBarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            horizontalBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4),
            horizontalBarView.heightAnchor.constraint(equalToConstant: 8),
            ])
        horizontalBarLeftAnchorConstraint = horizontalBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width  / 4
        horizontalBarLeftAnchorConstraint?.constant = x
         
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()

        }, completion: nil)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellReuseIdentifier, for: indexPath) as! MenuCell
        cell.imageView.image =  UIImage(named: images[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)

         return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
