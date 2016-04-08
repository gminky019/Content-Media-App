//
//  SubHero.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/2/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class SubHero {
    let type: String
    let main: Content
    let sub: [Content]
    
    init(cType: String, hero: Content, subHero: [Content])
    {
        self.type = cType
        self.main = hero
        self.sub = subHero
    }
    
}