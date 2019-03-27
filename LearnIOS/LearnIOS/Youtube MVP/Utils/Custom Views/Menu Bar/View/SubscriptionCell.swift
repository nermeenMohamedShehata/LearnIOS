//
//  SubscriptionCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/25/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
class SubscriptionCell: CustomFeedCell {
    
    override func fetchVideos() {
        ApiService.shared.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
