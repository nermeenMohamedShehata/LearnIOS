//
//  FacePageController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/28/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class FacePageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let images = ["sample4", "kids", "mumbai1", "native_americans", "native_americans2", "native_americans3", "barbies", "mixed_races2", "mixed_races3", "mixed_races", "sample26", "sample25", "sample24", "sample23", "sample22", "sample21", "sample18", "sample17"]
    
    let cellId = "FaceCEll"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView?.isPagingEnabled = true
        let layoutFlow = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layoutFlow)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView?.register(FacePageCell.self, forCellWithReuseIdentifier: cellId)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FacePageCell
        
        cell.imageName = images[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

