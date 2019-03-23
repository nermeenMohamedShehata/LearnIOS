//
//  Video.swift
//  LearnIOS
//
//  Created by Nermeen Mohamed on 3/18/19.
//  Copyright © 2019 Nermeen Mohamed. All rights reserved.
//

import Foundation
class Video : NSObject{
    var thumbnailImageName : String?
    var title : String?
    var channel : Channel?
    var numberOfViews : NSNumber?
    var uploadData : NSDate?
}
class Channel : NSObject{
    var name:String?
    var profileImageName: String?
}
