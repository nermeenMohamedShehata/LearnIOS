//
//  ResultsVC.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/11/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    lazy var resultLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Congratulations you complete the survey"
        label.textAlignment = .center
        
        return label
    }()
    var question : Question?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupLayoutUI()
        setUpNavBar()
    }
    init(question : Question) {
        self.question = question
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func setupViews(){
        self.view.addSubview(resultLabel)
    }
    func setupResultLabelConstraints(){
        NSLayoutConstraint.activate([
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            ])
    }
    func setupLayoutUI(){
        setupViews()
        setupResultLabelConstraints()
    
    }
    func setUpNavBar(){
        //For title in navigation bar
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.view.tintColor = UIColor.orange
        self.navigationItem.title = "Results"
        
        //For back button in navigation bar
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
