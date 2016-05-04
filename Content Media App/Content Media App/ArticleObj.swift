//
//  ArticleObj.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/3/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

/*
 This is the article object that inherits from content. 
 
 It contains two methods to set pictures if pictures are indeeed embedded within the article. 
 */

import Foundation

class ArticleObj: Content {
    var text: String?
    var author: String?
    var heroPics = [Picture]()
    var regularPics = [Picture]()
    
    init(title: String, description: String,key: String ,article: String?, author: String?) {
        super.init(title: title, description: description, key: key)
        
        self.text = article
        self.author = author
    }
    
    
    func setHeroPics(urls: [String])
    {
        for url in urls
        {
            self.heroPics.append(Picture(url: url));
        }
    }
    
    func setRegularPics(urls: [String])
    {
        for url in urls
        {
            self.regularPics.append(Picture(url: url))
        }
    }
}
