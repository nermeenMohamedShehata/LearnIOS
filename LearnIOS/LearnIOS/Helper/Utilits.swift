//
//  Utilits.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/12/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import UIKit
extension UIColor {
    static func rgb(red: CGFloat,green:CGFloat,blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
extension UILabel{
    func textAutoHeight(text: String) -> Int{
        
        self.frame = CGRect(x : self.frame.origin.x,y :self.frame.origin.y,width : self.frame.width ,height : self.heightForView(lbl : self,text: text, width: self.frame.width))
        return  Int(self.frame.height)//
    }
    
    func heightForView(lbl : UILabel ,text:String, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: lbl.frame.origin.x, y: lbl.frame.origin.y, width: lbl.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
//extension UIImageView {
//    
//    func loadImageUsingUrlString(urlString: String) {
//        let url = URL(string: urlString)!
//        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
//            
//            if error != nil {
//                print(error ?? "")
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data!)
//            }
//            
//        }).resume()
//    }
//    
//}
