//
//  FeedCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/25/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//
import UIKit
class CustomFeedCell : UICollectionViewCell{
    let cellId = "cellId"
     lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    var videos : [Video]?
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    func commonInit(){
        fetchVideos()
        setupLayoutUI()
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)

    }
    func fetchVideos() {
        ApiService.shared.fetchVideos { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    private func setupViews(){
        addSubview(collectionView)
    }
    private func setupLayoutUI(){
        setupViews()
        setupCollectionViewConstraints()
    }
    private func setupCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomFeedCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.videos?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        cell.video = videos?[indexPath.row]
        
        // Configure the cell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let heightFOrTitleLabel = estimateLabelHeight(index: indexPath.row)
        let height = (self.frame.width - 16 - 16 ) * 9 / 16
        return CGSize(width: self.frame.width, height: height + 16 + 8  + heightFOrTitleLabel + 8 + 1 + 8 + 44)
    }
    func estimateLabelHeight(index:Int) -> CGFloat{
        if let title = videos?[index].title {
            let size = CGSize(width: self.frame.width - 16 - 44 - 8 - 16, height: 1000)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoLauncher = VideoLauncher()
        videoLauncher.showVideoPlayer()
    }
    
}
