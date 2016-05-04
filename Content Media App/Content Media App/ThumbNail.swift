//
//  ThumbNail.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/2/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
 Description: 
 
    In each of the main page each peice of content forms a picture type and title. 
 
    We use this class as the class to store the "ThumbNails"
 
 */
import Foundation

class ThumbNail: Content {
    var pic: UIImage
    
    init(title: String, description: String, key: String, picture: UIImage) {
        
         self.pic = picture
        super.init(title: title, description: description, key: key)
        
       
    }
}