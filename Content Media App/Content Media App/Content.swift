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
    
    init(title: String , description: String)
    {
        self.title = title
        self.description = description
    }
}
