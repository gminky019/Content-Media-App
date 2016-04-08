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
    
    
    
}