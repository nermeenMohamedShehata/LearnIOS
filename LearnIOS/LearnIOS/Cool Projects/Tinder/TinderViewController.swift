//
//  TinderViewController.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/27/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit

class TinderViewController: UIViewController,UIGestureRecognizerDelegate {
    
    let numberOfColorsInRow = 15
    var cells = [String:UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let width = self.view.frame.width / CGFloat(numberOfColorsInRow)
        let numInHeight = Int(self.view.frame.height / CGFloat(width))
        for j in 0...numInHeight{
            for i in 0...numberOfColorsInRow{
                let cellView = UIView(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
                cellView.backgroundColor = randomColor()
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                let key = "\(i)\(j)"
                cells[key] = cellView
                self.view.addSubview(cellView)
            }
        }
        
        let tap = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        
        view.addGestureRecognizer(tap)
    }
    var selectedCell : UIView?
    @objc func handlePan(_ gestureRecognizer : UIPanGestureRecognizer){
       let location = gestureRecognizer.location(in: view)

        let width = self.view.frame.width / CGFloat(numberOfColorsInRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)\(j)"
        guard let cellView = cells[key] else {return}
        if selectedCell != cellView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        selectedCell = cellView
        view.bringSubviewToFront(cellView)
         UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
        if gestureRecognizer.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellView.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
    }
    
    func randomColor() -> UIColor {
        var rng = SystemRandomNumberGenerator()
        let red = CGFloat(Float.random(in: 0...255, using: &rng))
        let green = CGFloat(Float.random(in: 0...255, using: &rng))
        let blue = CGFloat(Float.random(in: 0...255, using: &rng))
        return UIColor.rgb(red: red, green: green, blue: blue)
    }
}
