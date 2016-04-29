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
    func getVideoContent(cont: Content, completion: (retContent: String) -> ())
    {
        let srcKey: String = self.help.createKeyFromContent(cont)
        
        self.contentAws.getVideoContent(srcKey, type: "Video", cont: cont){(single: String) in
            (completion(retContent: single))
        }
    }
    
    func getVideoPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
     
        
        awsContent.getContentMain("Video"){(loc: [String: [NSURL]]) in
            
            var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    func getLearnPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
     
        
        awsContent.getContentMain("Learn"){(loc: [String: [NSURL]]) in
            
          var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    func getReadPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
      
        
        awsContent.getContentMain("Read"){(loc: [String: [NSURL]]) in
            
           var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    
    func convertToThumbs(dict: [String: [NSURL]]) -> ContentPage
    {        var hero: [ThumbNail] = [ThumbNail]()
        var other : [ThumbNail] = [ThumbNail]()

        for url in dict["Hero"]!
        {
            hero.append(self.convertUrlToThumb(url))
            
        }
        
        for url in dict["Non"]!
        {
            other.append(self.convertUrlToThumb(url))
        }
        
        if(other.isEmpty || hero.isEmpty)
        {
            print("Error: while getting content Page could not convert to thumbs. May be because content dictionary is null")
        }
        return ContentPage(h: hero, o: other)
    }
    
    func convertUrlToThumb(url: NSURL) -> ThumbNail
    {
        return self.help.createThumbHelper(url)
    }
    
    
    
}