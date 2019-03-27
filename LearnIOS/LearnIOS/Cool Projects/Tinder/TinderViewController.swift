//
//  TinderViewController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/27/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let numberOfColorsInRow = 15
        let width = self.view.frame.width / CGFloat(numberOfColorsInRow)
        let numInHeight = Int(self.view.frame.height / CGFloat(width))
        for j in 0...numInHeight{
            for i in 0...numberOfColorsInRow{
                let cellView = UIView(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
                cellView.backgroundColor = randomColor()
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                self.view.addSubview(cellView)
            }
        }
        
        let tap = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        
        view.addGestureRecognizer(tap)
    }
    @objc func handlePan(_ gestureRecognizer : UIPanGestureRecognizer){
       let location = gestureRecognizer.location(in: view)
        print(location)
    }
    
    func randomColor() -> UIColor {
        var rng = SystemRandomNumberGenerator()
        let red = CGFloat(Float.random(in: 0...255, using: &rng))
        let green = CGFloat(Float.random(in: 0...255, using: &rng))
        let blue = CGFloat(Float.random(in: 0...255, using: &rng))
        return UIColor.rgb(red: red, green: green, blue: blue)
    }

}
