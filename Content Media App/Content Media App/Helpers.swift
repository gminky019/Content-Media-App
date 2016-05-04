//
//  Helpers.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    Description: 
 
    This class is purely a helper class that helps the middleware/ integration classes with processsing of data.
 */

import Foundation

class Helpers{
    
    var _awsInstance : ConnectToAWS
    var _contentAws: GetContentPages
    var _contentFlag: Bool
    
    init(aws: ConnectToAWS){
        self._awsInstance = aws
        self._contentAws = GetContentPages()
        self._contentFlag = false
    }
    
    //This method sets the instances of the aws backend for access
    func setContentAWS(aws: GetContentPages)
    {
        self._contentFlag = true
        
        self._contentAws = aws
    }
    
    /*
        This is the helper function that converts the main page dictionary to the usuable main page object.
        
        It takes the dictionary and with processing and helper functions creates the mainpage object,
    */
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
    
    /*
     A helper function for the main page creation that creates the sub content pieces oof the ui for the main page object.
    */
    func createContentSub(main: [String: Content], sub: [String: [Content]], key: String) -> SubHero
    {
        let subHero : SubHero = SubHero(cType: key, hero: main[key]!, subHero: sub[key]!)
        return subHero
    }
    
    /*
        This function is used to take a url for a aws object and creates the proper thumbnail object from that url.
    */
    func createThumbHelper(url: NSURL) -> ThumbNail
    {
        var thatT: [NSURL: [String: String]] = self._contentAws.getKeyStuff()
        
        if(!self._contentFlag)
        {
            objc_exception_throw("Tried to used helper for ContentAWS; content AWS was never set to correct obj")
    
            return ThumbNail(title: thatT[url]!["title"]! , description: getDesc(url), key: thatT[url]!["key"]!, picture: UIImage(contentsOfFile: url.path!)!)
        }
        else
        {
            
            
            
            return ThumbNail(title: thatT[url]!["title"]! , description: getDesc(url), key: thatT[url]!["key"]!, picture: UIImage(contentsOfFile: url.path!)!)
        }
    }
    
    //This method takes the url and finds the title created in the backend for it.
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
    
    //This is a stubbed out methid that would get the description for the content from the backend if it existed
    //in this case the description was not feasable with current functionailty.
    func getDesc(url: NSURL) -> String
    {
        return ""
    }
    
    // This is a depreciated function that would find the key name
    // it is not used because the key name is already passed from the backend.
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

    /*
        This mehtod creates the key from the content given to it. Some processing is needed so the ky can be readable by the backend. 
    */
    func createKeyFromContent(cont: Content) -> String
    {
        let oldKey: String = cont.awskey
        
        //split key
        let tempArr: [String] = oldKey.characters.split{$0 == "/"}.map(String.init)
        
        let arrcount: Int = tempArr.count
        var str: String = tempArr[arrcount-1].lowercaseString
        
        str += ".txt"
        str = str.stringByReplacingOccurrencesOfString(":", withString: "-")
        
        return str

    }
}