//
//  MiddleIntegration.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class MiddleIntegration{
    
    let aws: ConnectToAWS
    let help: Helpers
    let contentAws: GetSingleContent
    
    init()
    {
        self.aws = ConnectToAWS()
        self.help = Helpers(aws: self.aws)
        self.contentAws = GetSingleContent()
    }
    
    func getMainPage(completion: (main: MainPageContent) -> ()){
        var mainP : MainPageContent?
        
        self.aws.getMain({(main: [String: [NSURL]]) in
           mainP =  self.help.setMainPageContentObj(main)
            (completion(main: mainP!))
        })
        
    }
    
    func getContent(cont : Content, completion: (retContent: Content) -> ())
    {
        let srcKey: String = self.help.createKeyFromContent(cont)
        
        self.contentAws.getContent(srcKey, type: "Read", cont: cont){(single: Content) in
            (completion(retContent: single as! ArticleObj))
        }
        
    }
    
    func getVideoPage(completion: (returned: [ThumbNail]) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        var temp: [ThumbNail] = [ThumbNail] ()
        
        awsContent.getContentMain("Video"){(loc: [String: [NSURL]]) in
            
            temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
        
    }
    
    func getLearnPage(completion: (returned: [ThumbNail]) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        var temp: [ThumbNail] = [ThumbNail] ()
        
        awsContent.getContentMain("Learn"){(loc: [String: [NSURL]]) in
            
            temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    func getReadPage(completion: (returned: [ThumbNail]) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        var temp: [ThumbNail] = [ThumbNail] ()
        
        awsContent.getContentMain("Read"){(loc: [String: [NSURL]]) in
            
            temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    func convertToThumbs(dict: [String: [NSURL]]) -> [ThumbNail]
    {
        var temp: [ThumbNail] = [ThumbNail]()

        for url in dict["Hero"]!
        {
            temp.append(self.convertUrlToThumb(url))
        }
        
        for url in dict["Non"]!
        {
            temp.append(self.convertUrlToThumb(url))
        }
        
        if(temp.isEmpty)
        {
            print("Error: while gettign content Page could not convert to thumbs. May be because content dictionary is null")
        }
        return temp
    }
    
    func convertUrlToThumb(url: NSURL) -> ThumbNail
    {
        return self.help.createThumbHelper(url)
    }
    
    
    
}