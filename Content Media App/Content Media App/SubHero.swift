//
//  SubHero.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/2/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    Description: 
 
        In the main page there are a complex ui formatting that are dubbed subHero. 
 
        To make the front end processing easier we used this class to format an object specifically for the sub hero. 
 */
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