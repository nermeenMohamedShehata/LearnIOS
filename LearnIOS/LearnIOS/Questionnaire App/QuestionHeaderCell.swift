//
//  QuestionHeaderCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/10/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class QuestionHeaderCell: UITableViewHeaderFooterView {

    lazy  var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sample Question"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
        setupLayout()
    }
    
    private func setupViews(){
        addSubview(nameLabel)
    }
    private func setupLayout(){
        setupViews()
        setupNameLabelConst()
    }
    private func setupNameLabelConst(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
            ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
