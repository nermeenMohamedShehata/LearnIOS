//
//  HomeCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/16/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            
            setupThumbnailImage()
            
            setupProfileImage()
            
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                let subtitleText = "\(channelName) • \(numberFormatter.string(from: numberOfViews)!) • 2 years ago "
                subTitleTextView.text = subtitleText
            }
            
            //measure title text
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
            }
            
            
        }
    }
    
    func setupProfileImage() {
        if let profileImageUrl = video?.channel?.profileImageName {
            userProfileImageView.loadImageUsingUrlString(urlString: profileImageUrl)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageUrl = video?.thumbnailImageName {
            thumbnailImageView.loadImageUsingUrlString(urlString: thumbnailImageUrl)
        }
    }
    lazy private var thumbnailImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.image = R.image.taylor_swift_blank_space()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
 
        return imageView
    }()
    
    lazy private var userProfileImageView : CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = R.image.taylor_swift_profile()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    lazy private var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Title label"
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy private var subTitleTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorTextVEO + 2,543,243 views + 2 years"
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.textColor = .lightGray
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return textView
    }()
    lazy private var seperatorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    var titleLabelHeightConstraint : NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(userProfileImageView)
        addSubview(seperatorView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
    }
    private func setupLayouUI(){
        setupViews()
        setupThumbnailImageView()
        setupSeperatorView()
        setupUserProfileImageView()
        setuptitleLabel()
        setupSubTitleTextView()
    }
    private func setupThumbnailImageView(){
        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    private func setupUserProfileImageView(){
        NSLayoutConstraint.activate([
            userProfileImageView
                .leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userProfileImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 44),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 44),
            
            ])
    }
    private func setuptitleLabel(){
        NSLayoutConstraint.activate([
            titleLabel
                .leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8),
            titleLabel
                .trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
           titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            
            ])
        titleLabelHeightConstraint = titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
    }
    private func setupSubTitleTextView(){
        NSLayoutConstraint.activate([
            subTitleTextView
                .leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8),
            subTitleTextView
                .trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
            ])
    }
    private func setupSeperatorView(){
        NSLayoutConstraint.activate([
            seperatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            seperatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            seperatorView.heightAnchor.constraint(equalToConstant: 1),
            seperatorView.topAnchor.constraint(equalTo: subTitleTextView.bottomAnchor, constant: 8),
            seperatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            ])
    }
}
