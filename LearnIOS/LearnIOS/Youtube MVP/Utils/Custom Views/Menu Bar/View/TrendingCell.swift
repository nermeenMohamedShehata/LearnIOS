//
//  TrendingCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/25/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
class TrendingCell: CustomFeedCell {
    
    override func fetchVideos() {
        ApiService.shared.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
