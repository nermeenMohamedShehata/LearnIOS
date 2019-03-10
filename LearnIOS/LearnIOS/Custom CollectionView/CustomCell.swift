//
//  CustomCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text label"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
   
    func setupViews(){
        addSubview(nameLabel)
    }
    func layoutUI(){
        backgroundColor = .red
        setupViews()
        setupNameLabelConstraints()
    }
    func setupNameLabelConstraints(){
      NSLayoutConstraint.activate([
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant:16),
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor),
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
