//
//  AutoTextViewController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/30/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class AutoTextViewController: UIViewController {

    lazy var textView : UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.backgroundColor = .lightGray
        textview.font = UIFont.preferredFont(forTextStyle: .headline)
        textview.delegate = self
        textview.isScrollEnabled = false
        textview.sizeToFit()
        return textview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        self.view.addSubview(textView)
        textViewConstraint()
        
    }
    func textViewConstraint(){
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            ])
    }
}
extension AutoTextViewController : UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
//        self.view.layoutSubviews()
//        self.view.layoutIfNeeded()
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
    }
}
