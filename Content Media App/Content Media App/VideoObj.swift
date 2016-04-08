//
//  VideoObj.swift
//  Content Media App
//
//  Created by Garrett Minky on 2/27/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class VideoObj: Content {
    
    init(Vidtitle: String, Viddescription: String,url: String, youtube: Bool , other: Bool,key: String ,otherDescr: String? )
    {
        super.init(title: Vidtitle, description: Viddescription, key: key)
        
        self.url = NSURL(string: url)
        
        if(youtube)
        {
            self.youtube = true
        }
        else if(!youtube && other)
        {
            self.otherSourceType = true
            self.otherSourceDescr = otherDescr
        }
        else
        {
            self.vimeo = true
        }
        
    }
    
    var url: NSURL?
    var vimeo = false
    var youtube = false
    var otherSourceType = false
    var otherSourceDescr: String?
}
