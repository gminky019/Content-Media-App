//
//  videoViewController.swift
//  Content Media App
//
//  Created by Jordan Harris on 4/29/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class videoViewController: UIViewController {

    @IBOutlet weak var videoView: UIWebView!
    
    var articleThumbnail: ThumbNail!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        var key: String = self.stripKey(self.articleThumbnail.awskey)
        
        
        
        var tempC = Content(title: self.articleThumbnail.title, description: self.articleThumbnail.description, key: key)
        
        var integrate: MiddleIntegration = MiddleIntegration()
        
        integrate.getVideoContent(tempC){(retContent: String) in
            var url: NSURL = NSURL(string: retContent)!
            
            let myReq: NSURLRequest = NSURLRequest(URL: url)
            
            self.videoView.loadRequest(myReq)
        }
    
    }
    
    func stripKey(temp: String) -> String{
        let tempArr: [String] = temp.characters.split{$0 == "/"}.map(String.init)
        
        let count : Int = tempArr.count
        
        if(count != 0)
        {
            var final: String = tempArr[count-1]
            
            final = "/" + final
            
            return final
        }
        else
        {
            return "BAD SPlitting "
        }
    }

}