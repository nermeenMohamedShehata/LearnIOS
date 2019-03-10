//
//  ViewController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionViewController ,UICollectionViewDelegateFlowLayout{

    let customIdintifier = "customIdintifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.backgroundColor = .white
       // collectionView.register(CustomCell.self, forCellWithReuseIdentifier: customIdintifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
       // layout.itemSize = CGSize(width: 60, height: 60)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: customIdintifier)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: customIdintifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}
