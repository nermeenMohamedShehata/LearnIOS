//
//  MenuBar+CollectionView.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/25/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
extension MenuBar : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func setupMenuBarCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: menuCellReuseIdentifier)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width  / 4
        horizontalBarLeftAnchorConstraint?.constant = x

        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()

        }, completion: nil)
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellReuseIdentifier, for: indexPath) as! MenuCell
        cell.setImageView(image: UIImage(named: images[indexPath.row])?.withRenderingMode(.alwaysTemplate) ?? UIImage(named: "home")!)
        
//        cell.imageView.image =  UIImage(named: images[indexPath.row])?.withRenderingMode(.alwaysTemplate)
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
extension MenuBar {
  
    
}
