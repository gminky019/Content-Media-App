//
//  MiddleIntegration.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    Description: 
 
    This is the inegration layer of the middleware. 
 
    This class is the class that handles requests from the front end processes the requests and calls the proper methods from the backend. Then on return it performs more processing and oasses back the proper objects to the front end.
 */

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
    
    /*
        This is the method that gets the main page content from the backend and returnds the main page content object
    */
    func getMainPage(completion: (main: MainPageContent) -> ()){
        var mainP : MainPageContent?
        
        self.aws.getMain({(main: [String: [NSURL]]) in
           mainP =  self.help.setMainPageContentObj(main)
            (completion(main: mainP!))
        })
        
    }
    /*
        This is the method that gets a single piece of non video content. It take sin the content from the object and then calls the proper backend object and retrieves the article.
    */
    func getContent(cont : Content, completion: (retContent: Content) -> ())
    {
        let srcKey: String = self.help.createKeyFromContent(cont)
        
        self.contentAws.getContent(srcKey, type: "Read", cont: cont){(single: Content) in
            (completion(retContent: single as! ArticleObj))
        }
        
    }
    
    /*
        This is the method that gets the single video from the video thumbnail passed to it from the IUI/frontend. 
     
        It calls the proper method from the backend and gets the video object.
    */
    func getVideoContent(cont: Content, completion: (retContent: String) -> ())
    {
        let srcKey: String = self.help.createKeyFromContent(cont)
        
        self.contentAws.getVideoContent(srcKey, type: "Video", cont: cont){(single: String) in
            (completion(retContent: single))
        }
    }
    
    /*
     This is the method that retrieves the video content page. 
    It uses helpers and the backend method to form the proper objects for the vieo content page.
    */
    func getVideoPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
     
        
        awsContent.getContentMain("Video"){(loc: [String: [NSURL]]) in
            
            var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    /*
     This is the method that retrieves the learn content page.
     It uses helpers and the backend method to form the proper objects for the learn content page.
     */
    func getLearnPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
     
        
        awsContent.getContentMain("Learn"){(loc: [String: [NSURL]]) in
            
          var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    /*
     This is the method that retrieves the rean content page.
     It uses helpers and the backend method to form the proper objects for the read content page.
     */
    func getReadPage(completion: (returned: ContentPage) -> ())
    {
        let awsContent: GetContentPages = GetContentPages()
        
        self.help.setContentAWS(awsContent)
        
      
        
        awsContent.getContentMain("Read"){(loc: [String: [NSURL]]) in
            
           var temp = self.convertToThumbs(loc)
            
            completion(returned: temp)
        }
    }
    
    /*
        This is a helper method that converts urls in a dictionary to thumbnails.
    */
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
    
    
    //This helper method calls the helper class to convert urls ad create the proper thumbnail.
    func convertUrlToThumb(url: NSURL) -> ThumbNail
    {
        return self.help.createThumbHelper(url)
    }
    
    
    
}