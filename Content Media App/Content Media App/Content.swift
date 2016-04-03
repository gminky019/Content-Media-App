//
//  Content.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/1/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

//this is the content super class 

class Content {
    
    var title: String
    var description: String
    var awskey: String
    
    init(title: String , description: String, key: String)
    {
        self.title = title
        self.description = description
        self.awskey = key
    }
}
