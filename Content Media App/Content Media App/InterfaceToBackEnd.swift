//
//  InterfaceToBackEnd.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/24/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class BackEndInterface {
    
    func getMain() -> MainPageContent{
        
        var mainPage = MainPageContent(heros: [Content](), sub: [Content](), contSub: [SubHero]())
        
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
    
    func startCall(){
        
    }
    
    func getSingle(title: String, type: String) -> Content
    {
        var single = Content(title: title, description: type,key: "" )
        
        return single
    }
    
    
    
}
