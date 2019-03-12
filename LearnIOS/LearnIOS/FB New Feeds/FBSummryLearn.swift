//
//  FBSummryLearn.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/11/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import Foundation

/*
1-  UIColor.init(white: 0.95, alpha: 1)
2- View controller-based status bar appearance in Info.plist to change name of properties in top of nav bar like time date wifi color
 
 3- add one label with 2 line each has it's own color
 
    var attributedText  = NSMutableAttributedString(string: "Sample Text", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14)])
 
    attributedText.append(NSAttributedString(string: "\nSeptemper - San Fransico * ", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12),NSAttributedString.Key.foregroundColor:UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
 
 // NSMutableParagraphStyle ->  for space between 2 line
 
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 4
    attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
    label.attributedText = attributedText
 
 attachment -> attach image to label
 
*/
