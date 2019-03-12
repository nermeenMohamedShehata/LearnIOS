//
//  FeedCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/11/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "zuckprofile")
        return imageView
    }()
    lazy private var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        // color for each line
        var attributedText  = NSMutableAttributedString(string: "Sample Text", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\nSeptemper - San Fransico * ", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor:UIColor.rgb(red: 155, green: 161, blue: 171)]))
        
        // for space between 2 line
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        // attach image to second line
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe_small")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        
        label.attributedText = attributedText
        return label
    }()
    lazy private var statusTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Manazella : from dark side."
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    lazy private var statusImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    lazy private var likesCommentLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "4000 Likes - 1K Comments"
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    lazy private var divideLineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    lazy var likeButton : UIButton = {
       return FeedCell.buttonForTitle(title: "Like", imageName: "like")
    }()
    lazy var commentButton : UIButton = {
        return FeedCell.buttonForTitle(title: "Comment", imageName: "comment")
    }()
    lazy var shareButton : UIButton = {
        return FeedCell.buttonForTitle(title: "Share", imageName: "share")
    }()
   
    static func buttonForTitle(title:String,imageName:String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(divideLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
    }
    private func setupLayout(){
        backgroundColor = .white
        setupViews()
        setupProfileImageConstraints()
        setupNameLabelConstraints()
        setupStatusTextViewConstraints()
        setupStatusImageViewConstraints()
        setupLikeCommentsLabelConstraints()
        setupDivideLineViewConstraints()
        setupLikeButtonConstraints()
        setupCommentButtonConstraints()
        setupShareButtonConstraints()
    }
    private func setupProfileImageConstraints(){
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    private func setupNameLabelConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12)
            ])
    }
    private func setupStatusTextViewConstraints(){
        NSLayoutConstraint.activate([
            statusTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            statusTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            statusTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),
            statusTextView.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    private func setupStatusImageViewConstraints(){
        NSLayoutConstraint.activate([
            statusImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            statusImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            statusImageView.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 4)
            ])
    }
    private func setupLikeCommentsLabelConstraints(){
        NSLayoutConstraint.activate([
            likesCommentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            likesCommentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            likesCommentLabel.topAnchor.constraint(equalTo: statusImageView.bottomAnchor, constant: 8),
            likesCommentLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    private func setupDivideLineViewConstraints(){
        NSLayoutConstraint.activate([
            divideLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            divideLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            divideLineView.heightAnchor.constraint(equalToConstant: 0.4),
            divideLineView.topAnchor.constraint(equalTo: likesCommentLabel.bottomAnchor, constant: 8),
            ])
    }
    private func setupLikeButtonConstraints(){
        NSLayoutConstraint.activate([
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            likeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
//            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            likeButton.heightAnchor.constraint(equalToConstant: 44),
            likeButton.topAnchor.constraint(equalTo: divideLineView.bottomAnchor, constant: 0),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            ])
    }
    private func setupCommentButtonConstraints(){
        NSLayoutConstraint.activate([
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
            commentButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            commentButton.heightAnchor.constraint(equalToConstant: 44),
            commentButton.topAnchor.constraint(equalTo: divideLineView.bottomAnchor, constant: 0),
            ])
    }
    private func setupShareButtonConstraints(){
        NSLayoutConstraint.activate([
            shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 8),
            shareButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            shareButton.heightAnchor.constraint(equalToConstant: 44),
            shareButton.topAnchor.constraint(equalTo: divideLineView.bottomAnchor, constant: 0),
            ])
    }
}
