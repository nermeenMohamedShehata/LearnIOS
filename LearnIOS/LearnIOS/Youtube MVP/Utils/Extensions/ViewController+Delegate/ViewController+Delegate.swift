//
//  ViewController+Delegate.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/25/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
// MenuBar Delegate
protocol  MenuBarProtocol{
    func attachMenuBarView()
    func deattachMenuBarView()
}
var menuBar : MenuBar?
extension UIViewController : MenuBarProtocol, MenuBarDelegate {
    func attachMenuBarView() {
        DispatchQueue.main.async {
            self.setupMenuBar()
            menuBar = MenuBar(frame: .zero)
            guard menuBar != nil else {return}
            self.view.addSubview(menuBar!)
            menuBar!.translatesAutoresizingMaskIntoConstraints = false
            menuBar!.heightAnchor.constraint(equalToConstant: 50).isActive = true
            menuBar!.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            menuBar!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
            menuBar!.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
            
            self.view.addSubview(menuBar!)
            self.view.addConstraintsWithFormat("H:[v0]", views: menuBar!)
            self.view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar!)
            menuBar?.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
            menuBar?.homeController = self as? HomeController
         }
    }
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        self.view.addSubview(redView)
    }
    func deattachMenuBarView() {
        DispatchQueue.main.async {
            menuBar?.removeFromSuperview()
            menuBar = nil
        }
    }
    
    func didTapHome(_ sender: UIButton) {
        print("didTapHome")
    }
    func didTapTrending(_ sender: UIButton) {
        print("didTapTrending")
    }
    
    func didTapSubscriptions(_ sender: UITextField) {
        print("didTapSubscriptions")
    }
    
    func didTapProfile(_ sender: UIButton) {
        print("didTapProfile")
    }
}
