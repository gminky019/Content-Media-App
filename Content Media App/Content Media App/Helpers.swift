//
//  Helpers.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class Helpers{
    
    var _awsInstance : ConnectToAWS
    
    init(aws: ConnectToAWS){
        self._awsInstance = aws
        
    }
    
    
    func setMainPageContentObj(urlDict: [String: [NSURL]]) -> MainPageContent{
        var mainKeys = urlDict.keys

        var subHeroDict : [String : [Content]] = [String: [Content]]()
        var typeHeroDict : [String: Content] = [String: Content]()

        var MainContents: [Content] = [Content]()
        var subMainContents: [Content] = [Content]()
        var subHeroes: [SubHero] = [SubHero]()
        
        for key in mainKeys
        {
            var url: [NSURL] = urlDict[key]!

            
            switch key{
                
                case "main":
                    for u in url
                    {
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        MainContents.append(ThumbNail(title: self.getTitle(u), description: self.getDesc(u), key: self.getKeyName(u.path!) , picture: img))
                    }
                
                case "mainsub":
                    for u in url
                    {
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        subMainContents.append(ThumbNail(title: self.getTitle(u), description: self.getDesc(u), key: self.getKeyName(u.path!) , picture: img))
                    }
                
                case "read":
                    for u in url{
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        typeHeroDict["read"] = ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img)
                        
                }
                case "readsub":
                    
                    var subArr : [ThumbNail] = [ThumbNail]()
                    for u in url{
                        
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        subArr.append(ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img))
                        
                        subHeroDict["read"] = subArr
                }
                
                case "learn":
                    for u in url{
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        typeHeroDict["learn"] = ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img)
                        
                }
                case "learnsub":
                    var subArr : [ThumbNail] = [ThumbNail]()
                    for u in url{
                        
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        subArr.append(ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img))
                        
                        subHeroDict["learn"] = subArr
                }
                
                
                case "watch":
                    for u in url{
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        typeHeroDict["watch"] = ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img)
                        
                }
                case "watchsub":
                    var subArr : [ThumbNail] = [ThumbNail]()
                    for u in url{
                        
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        subArr.append(ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img))
                        
                        subHeroDict["watch"] = subArr
                }
                
                case "shop":
                    for u in url{
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        
                        typeHeroDict["shop"] = ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img)
                        
                }
                case "shopsub":
                
                    var subArr : [ThumbNail] = [ThumbNail]()
                    for u in url{
                        
                        var img : UIImage = UIImage(contentsOfFile: u.path!)!
                        subArr.append(ThumbNail(title: getTitle(u), description: getDesc(u), key: getKeyName(u.path!), picture: img))
                        
                        subHeroDict["shop"] = subArr
                }
            default: break
                
            }
        }
        
        subHeroes.append(createContentSub(typeHeroDict, sub: subHeroDict, key: "read"))
        subHeroes.append(createContentSub(typeHeroDict, sub: subHeroDict, key: "watch"))
       // subHeroes.append(createContentSub(typeHeroDict, sub: subHeroDict, key: "shop"))
        subHeroes.append(createContentSub(typeHeroDict, sub: subHeroDict, key: "learn"))
        
        return MainPageContent(heros: MainContents, sub: subMainContents, contSub: subHeroes)
    }
    
    func createContentSub(main: [String: Content], sub: [String: [Content]], key: String) -> SubHero
    {
        let subHero : SubHero = SubHero(cType: key, hero: main[key]!, subHero: sub[key]!)
        return subHero
    }
    
    func getTitle(url: NSURL) -> String
    {
        var temp : String? = self.getKeyName(url.path!)
        
        
        let tempArr: [String] = temp!.characters.split{$0 == "/"}.map(String.init)
        
        let arrcount: Int = tempArr.count
        
        if(arrcount != 0)
        {
            let final: String = tempArr[arrcount-1]
            
            return final.stringByReplacingOccurrencesOfString("_", withString: " " )
        }
        else
        {
            return "BAD Title Splitting"
        }
        
    }
    func getDesc(url: NSURL) -> String
    {
        return ""
    }
    
    func getKeyName(key: String) -> String{
        /*
        if(self._awsInstance.getUrlKeyDict().
        {*/
        return self._awsInstance.getUrlKeyDict()[key]!
       /*
        else{
            return "Getting Key Error"
        }*/
        //return ""
    }
    
    func createKeyFromContent(cont: Content) -> String
    {
        let oldKey: String = cont.awskey
        
        //split key
        let tempArr: [String] = oldKey.characters.split{$0 == "/"}.map(String.init)
        
        let arrcount: Int = tempArr.count - 2
        var str: String = ""
        
        for i in 0...arrcount
        {
            str += (tempArr[i]+"/")
        }
        
        str = str + "ArticleText.rtf"
        
        return str

    }
}