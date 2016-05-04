//
//  MainPage.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/24/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

/*
 Description:
 
    Since the main page of the application holds complex data this is the class that will format the front page to make it usuable to the front end ui.
 */

import Foundation

class MainPageContent {
    var hero: [Content]
    var subHero: [Content]
    var contentHero: [SubHero]
    
    
    init (heros: [Content], sub:[Content], contSub:[SubHero])
    {
        self.hero = heros
        self.subHero = sub
        self.contentHero = contSub
    }
}