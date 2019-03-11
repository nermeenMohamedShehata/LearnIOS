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
        attributedText.append(NSAttributedString(string: "\nSeptemper - San Fransico * ", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor:UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
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
        textView.backgroundColor = .yellow
        return textView
    }()
    lazy private var statusImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
   
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
    }
    private func setupLayout(){
        backgroundColor = .white
        setupViews()
        setupProfileImageConstraints()
        setupNameLabelConstraints()
        setupStatusTextViewConstraints()
        setupStatusImageViewConstraints()
    }
    private func setupProfileImageConstraints(){
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
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
            statusImageView.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 4),
            statusImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
