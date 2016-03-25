//
//  ConnectToFrontend.swift
//  Content Media App
//
//  Created by Evan Jin on 3/24/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation


class IntegrationFrontend{
    
    var DateTime: Int?
    
    func getMain() -> MainPageContent{
        
        var mainPage = MainPageContent(heros: [Content](), sub: [Content]())
        
        return mainPage
    }
    
    func getWatch() -> [Content]{
        var watch = [Content]()
        
        return watch
    }
    
    func getRead() -> [Content]{
        var read = [Content]()
        
        return read
    }
    
    func getShop() -> [Content]{
        var shop = [Content]()
        
        return shop
    }
    
    func getLearn() -> [Content]{
        var learn = [Content]()
        
        return learn
    }
    
    func getSingle(title: String, type: String) -> Content
    {
        var single = Content(title: title, description: type)
        
        return single
    }
    
    func shareText( txt: String, contentURL: Content ){
        //open facebook api
    }
    
    func getUpdate( currUpdate: String ){
    
    }
}