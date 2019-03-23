//
//  SettingsLauncher.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/23/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
class SettingsLauncher : NSObject,UIGestureRecognizerDelegate{
    
    override init() {
        super.init()
    }
    let blackView = UIView()
  
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
     func showsettings(){
        print("123")
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
            
            let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView(sender:)))
            blackView.addGestureRecognizer(tap)
            tap.delegate = self
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height = 200
            let y = window.frame.height - CGFloat(height)
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 200)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
           
        }
    }
    @objc  func dismissView(sender: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                  self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
}
