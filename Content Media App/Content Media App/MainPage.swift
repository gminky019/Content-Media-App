//
//  MainPage.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/24/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

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