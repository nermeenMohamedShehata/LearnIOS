//
//  ToDoCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/9/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class ToDoCell: BaseCell {
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
 
    func setupViews(){
        addSubview(label)
    }
   
   override func setupLayout(){
        backgroundColor = .white
        setupViews()
        setupLabelConst()
    }
    func setupLabelConst(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16)
            ])
    }
   
}
