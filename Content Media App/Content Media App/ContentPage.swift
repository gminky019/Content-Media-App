//
//  ContentPage.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/28/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    Each content page holds its own complex ui format this class is used to help the ui front end with the content formatting.
 */

import Foundation

public class ContentPage{
    var _heroes: [ThumbNail]
    var _others: [ThumbNail]
    
    init(h: [ThumbNail], o: [ThumbNail])
    {
        self._heroes = h
        self._others = o
    }
}
