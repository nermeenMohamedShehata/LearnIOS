//
//  EntryCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/10/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class EntryCell: UICollectionViewCell {
    lazy private var titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = " Title Label Name"
        return label
    }()
    lazy private var contentSnippetTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.text = "Set text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text hereSet text hereSet text here Set text here Set text here"
        return textView
    }()
    lazy private var divideView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutUI()
    }
   private func setupViews(){
        addSubview(titleLabel)
        addSubview(contentSnippetTextView)
        addSubview(divideView)
    }
    private func setupLayoutUI(){
        setupViews()
        setupTitleLabelConstraints()
        setupContentTextViewConstraints()
        setupDivideViewConstraints()
    }
    private func setupTitleLabelConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
            ])
    }
    private func setupContentTextViewConstraints(){
        NSLayoutConstraint.activate([
            contentSnippetTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            contentSnippetTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            contentSnippetTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentSnippetTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
    }
    private func setupDivideViewConstraints(){
        NSLayoutConstraint.activate([
            divideView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            divideView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            divideView.heightAnchor.constraint(equalToConstant: 2),
            divideView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
