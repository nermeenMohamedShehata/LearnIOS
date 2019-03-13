//
//  FeedController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/11/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
protocol FeedCellView {
    func setPost(post:Post)
}

class FeedController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    private let feedCellIdentifier = "feedCell"
    
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let postMark = Post()
        postMark.name = "Mark Zucherberg"
        postMark.postStatusText = "Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 NermeenMohamed Sheata Status for Steve Jobs  will be here Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 Status for mark will be here 1 NermeenMohamed Sheata Status for Steve Jobs  will be here  ya ahmed"
        postMark.profileImageName =  R.image.zuckprofile.name
        postMark.statusImageName = R.image.zuckdog.name
        postMark.numLikes = 1000
        postMark.numComments = 550
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.postStatusText = "Status for Steve Jobs  will be here"
        postSteve.profileImageName = R.image.steve_profile.name
        postSteve.statusImageName = R.image.steve_status.name
        postSteve.numLikes = 430
        postSteve.numComments = 1000
        
        let postGhandi = Post()
        postGhandi.name = "Ghandi"
        
        postGhandi.profileImageName = R.image.gandhi_profile.name
        postGhandi.statusImageName = R.image.gandhi_status.name
        postGhandi.numLikes = 80
        postSteve.numComments = 300
        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postGhandi)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }
    override func viewWillAppear(_ animated: Bool) {
        //nav bar
        self.navigationItem.title = "FaceBook Feed"
        //collectionview
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        // Register cell classes
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: feedCellIdentifier)
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifier, for: indexPath) as! FeedCellView
        cell.setPost(post: posts[indexPath.row])
       
        // Configure the cell
    
        return cell as! UICollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.row].postStatusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: self.view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
            let knownHeight : CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSize(width: self.view.frame.width, height: rect.height + knownHeight + 16)
        }
        return CGSize(width: self.view.frame.width, height: 500)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
