//
//  Picture.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/3/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation
import UIKit

class Picture {
    
    //most likely the situation
    var link: NSURL?
    var image: UIImage?
    
    //may not be needed depends on db type
    var data: NSData?
    
    init(url: String)
    {
        self.link = NSURL(string: url)
    }
    
    // this function is the asyncronous loading function for a data link
    func getDataAsync(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
        completion(data: data, response: response, error: error)
        }.resume()
    }
    
    //this function will load the picture from the link asyncronously and put the image into the class member image
    func getImage()
    {
        getDataAsync(self.link!){
            (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {
                () -> Void in
                guard let data = data where error == nil else {return }
                self.image = UIImage(data: data)
            }
        }
    }
}