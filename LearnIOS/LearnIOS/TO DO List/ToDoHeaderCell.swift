//
//  ToDoHeaderCell.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/10/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
protocol ToDoHeaderCellProtocol : class {
    func didTapAddItem(_ name:String)
}
class ToDoHeaderCell: BaseCell {

   lazy private var toDoTextField  : UITextField =  {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Add Item here"
        return textField
    }()
   lazy private var addButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(addItem(_:)), for: .touchUpInside)
        return button
    }()
    var delegate : ToDoHeaderCellProtocol?
    var addClosure: (String) -> () = {_ in }
    func setupViews(){
        addSubview(addButton)
        addSubview(toDoTextField)
    }
    @objc @IBAction func addItem(_ sender: UIButton){
        guard self.toDoTextField.text != nil && self.toDoTextField.text != "" else {
            return
        }
        addClosure(self.toDoTextField.text ?? "")
        self.toDoTextField.text = ""
    }
    override func setupLayout(){
        setupViews()
        setupButtonConst()
        setupTextConst()
    }
  
    func setupButtonConst(){
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
            ])
    }
    func setupTextConst(){
        NSLayoutConstraint.activate([
            toDoTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            toDoTextField.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -16),
            toDoTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            toDoTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
    }
}

class BaseCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayout(){}
}
