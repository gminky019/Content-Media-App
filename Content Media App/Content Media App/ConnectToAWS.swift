//
//  ConnectToAWS.swift
//  Content Media App
//
//  Created by Garrett Minky on 3/31/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class ConnectToAWS{
    let _transferManager: AWSS3TransferManager
    var _completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?
    var _prefix: String
    let _s3: AWSS3
    var _keys: [AWSS3Object]
    var _MainKeyDict: [String: AWSS3Object]
    var _HeroURLDict: [String: [NSURL]]
    var _urlsTemp : [NSURL]
    var _urlKey : [String: String]
    var _globalCountVar : Int
    
    
    //let _baseURL : String
    
    init()
    {
        self._transferManager = AWSS3TransferManager.defaultS3TransferManager()
        //self._baseURL =
        self._prefix = ""
        self._s3 = AWSS3.defaultS3()
        self._keys = [AWSS3Object]()
        self._urlsTemp = [NSURL]()
        self._MainKeyDict = [String: AWSS3Object]()
        self._HeroURLDict = [String: [NSURL]]()
        self._urlKey = [String: String]()
        self._globalCountVar = 0
    
    }
    
    
    func getMain(completion: (main: [String: [NSURL]])->()){
        
        self.getKeys("Hero") {(keys: [AWSS3Object]) in
             self._keys = keys
            //parse string for key
            
            self.setMainKeyDict(keys)
            
            let sortKeys: [AWSS3Object] = self.parseKeys("Main", allKey: keys)
            
            //set download req
            let req : [AWSS3TransferManagerDownloadRequest] = self.setReq(sortKeys)
            
          //  self.testGet()
            
            //initiate download
           // let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            
            var urls: [NSURL]  = [NSURL]()
            
            
            self.downLoadMain(req) {( mainDict: [String: [NSURL]]) in
                
                (completion(main: mainDict))
            }
            self._urlsTemp = urls
        }
        
        
    }
    
    func downLoadMain(reqs : [AWSS3TransferManagerDownloadRequest], complete: (mainDict: [String: [NSURL]])-> ())
    {
        self._globalCountVar = 0
        
        let firstGroup = dispatch_group_create()
        
        for r in reqs
        {
            // dispatch_async(queue, {() -> Void in
            
            dispatch_group_enter(firstGroup)
            
            let DictKey: String = self.findMainURLKey(r.key!)
            
            
            
            self.downLoadV2(r, group: firstGroup) { (url: NSURL) in
                
                var temp: [NSURL]
                
                if(!self._HeroURLDict.keys.contains(DictKey).boolValue)
                {
                    temp = [NSURL]()
                }
                else
                {
                    temp = self._HeroURLDict[DictKey]!
                }
                
                temp.append(url)
                
                self._HeroURLDict[DictKey] = temp
                dispatch_group_leave(firstGroup)
                
                self._globalCountVar += 1
                self._urlsTemp.append(url)
                
                
            }
        }
        
        dispatch_group_notify(firstGroup, dispatch_get_main_queue()) {

        (complete(mainDict: self._HeroURLDict))
        }
    }
    
    func downLoadV2(downReq: AWSS3TransferManagerDownloadRequest, group: dispatch_group_t, completionDown: (url: NSURL) ->())
    {
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()

        
        var downLoadPath: NSURL?
        
        print("Getting:  " + downReq.key! + "\n")
        dispatch_group_enter(group)
        
        transferManager.download(downReq).continueWithBlock({(task) -> AnyObject! in
            if let error = task.error{
                if error.domain == AWSS3TransferManagerErrorDomain as String
                    && AWSS3TransferManagerErrorType(rawValue: error.code) == AWSS3TransferManagerErrorType.Paused{
                    print ("DownLoad Paused")
                }else{
                    print("FAILED ON  " + downReq.key! + "\n")
                    print("DownLoad Failed: [\(error)]" + "\n\n")
                }
            }
            else if let exception = task.exception
            {
                print("download failed: [\(exception)]")
            }
            else{
                dispatch_group_leave(group)
                
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    
                    print("SUCCESS ON  " + downReq.key! + "\n\n")
                    downLoadPath = downReq.downloadingFileURL
                    
                    dispatch_group_leave(group)
                    
                    completionDown(url: downLoadPath!)
                })
            }
            return nil
        })
       
    }
    
    func findMainURLKey(key: String) -> String
    {
        var dicKey: String = ""
        
        let keyVal = key.lowercaseString
        
        if(keyVal.lowercaseString.rangeOfString("hero") != nil)
        {
            if(keyVal.lowercaseString.rangeOfString("main") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                {
                    dicKey = "mainsub"
                }
                else
                {
                   dicKey = "main"
                }
            }
            else if (keyVal.lowercaseString.rangeOfString("read/hero") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                {
                    dicKey = "readsub"
                }
                else
                {
                    dicKey = "read"
                }
            }
            else if(keyVal.lowercaseString.rangeOfString("read/sub") != nil)
            {
                dicKey = "readsub"
            }
            else if(keyVal.lowercaseString.rangeOfString("learn/hero") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                {
                    dicKey = "learnsub"
                }
                else
                {
                    dicKey = "learn"
                }
            }
            else if(keyVal.lowercaseString.rangeOfString("learn/sub") != nil)
            {
                dicKey = "learnsub"
            }
            else if(keyVal.lowercaseString.rangeOfString("shop/hero") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                {
                    dicKey = "shopsub"
                }
                else
                {
                    dicKey = "shop"
                }
            }
            else if(keyVal.lowercaseString.rangeOfString("shop/sub") != nil)
            {
                dicKey = "shopsub"
            }
            else if(keyVal.lowercaseString.rangeOfString("watch/hero") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                {
                    dicKey = "watchsub"
                }
                else
                {
                    dicKey = "watch"
                }
            }
            else if(keyVal.lowercaseString.rangeOfString("watch/sub") != nil)
            {
                dicKey = "watchsub"
            }
            else
            {
                
            }
        }
        
        
        return dicKey
    }
    
    func setMainKeyDict(allKey: [AWSS3Object])
    {
        for key in allKey
        {
            let keyVal: String = key.key!.lowercaseString
            
            if(keyVal.lowercaseString.rangeOfString("hero") != nil)
            {
                if(keyVal.lowercaseString.rangeOfString("main") != nil)
                {
                    if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                    {
                        self._MainKeyDict["mainsub"] = key
                    }
                    else
                    {
                        self._MainKeyDict["main"] = key
                    }
                }
                else if (keyVal.lowercaseString.rangeOfString("read") != nil)
                {
                    if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                    {
                        self._MainKeyDict["readsub"] = key
                    }
                    else
                    {
                        self._MainKeyDict["read"] = key
                    }
                }
                else if(keyVal.lowercaseString.rangeOfString("learn") != nil)
                {
                    if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                    {
                        self._MainKeyDict["learnsub"] = key
                    }
                    else
                    {
                        self._MainKeyDict["learn"] = key
                    }
                }
                else if(keyVal.lowercaseString.rangeOfString("shop") != nil)
                {
                    if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                    {
                        self._MainKeyDict["shopsub"] = key
                    }
                    else
                    {
                        self._MainKeyDict["shop"] = key
                    }
                }
                else if(keyVal.lowercaseString.rangeOfString("watch") != nil)
                {
                    if(keyVal.lowercaseString.rangeOfString("sub") != nil)
                    {
                        self._MainKeyDict["watchsub"] = key
                    }
                    else
                    {
                        self._MainKeyDict["watch"] = key
                    }
                }
                else
                {
                    
                }
            }
        }
        
    }
    
    func parseKeys(type: String, allKey: [AWSS3Object]) -> [AWSS3Object]
    {
        var parsedKeys: [AWSS3Object] = [AWSS3Object]()
        
        switch type
        {
            case "Main":
            
            for k in allKey
            {
                let val: String = k.key!.lowercaseString
                
                if(val.lowercaseString.rangeOfString("hero") != nil)
                {
                    parsedKeys.append(k)
                }
            }
            
        default:
            print("Did not find type")
        }
        
        return parsedKeys
    }
    
    func setReq(s3Obj: [AWSS3Object]) -> [AWSS3TransferManagerDownloadRequest]
    {
        var reqList: [AWSS3TransferManagerDownloadRequest] = [AWSS3TransferManagerDownloadRequest]()
        
        
        for s3 in s3Obj{
            
            let tempDir = NSURL(fileURLWithPath: NSTemporaryDirectory())
            
            let downloadURL = NSTemporaryDirectory().stringByAppendingString(s3.key!)
            let tempURL = NSURL(fileURLWithPath: downloadURL)
            
            let url: NSURL = NSURL.fileURLWithPath(NSTemporaryDirectory(), isDirectory: true).URLByAppendingPathComponent(s3.key!)
            var str: String = s3.key!
            
            if(s3.key!.lowercaseString.rangeOfString("/") != nil)
            {
                str = s3.key!.stringByReplacingOccurrencesOfString("/", withString: "+")
            }

            
            let downFileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(str)
            let downFilePath = downFileURL.path!
                        self._urlKey[downFileURL.path!] = s3.key
            if NSFileManager.defaultManager().fileExistsAtPath(tempURL.path!){
                //reqList.append(nil)
                print("Error getting download request file path exists")
            }
            else
            {
                let downReq = AWSS3TransferManagerDownloadRequest()
                downReq.bucket = "contentmediaapp"
                downReq.key = s3.key
                downReq.downloadingFileURL = downFileURL
                
                reqList.append(downReq)
            }
            
            //downloadURL = nil
           // rempurl = nil
        }
        
        return reqList
    }
    
    func getKeys(prefix: String, completionKey: (keys: [AWSS3Object]) -> ()){
        
        let listObjectsRequest = AWSS3ListObjectsRequest()
        listObjectsRequest.bucket = "contentmediaapp"
        //listObjectsRequest.delimiter = "/"
       // listObjectsRequest.prefix = prefix
        
        self._s3.listObjects(listObjectsRequest).continueWithSuccessBlock({(task) -> AnyObject! in
            if let error = task.error{
                print("List objects Failed: [\(error)]")
            }
            if let exception = task.exception {
                print("list objects failed: [\(exception)]")
            }
            
            if let listOutput = task.result as? AWSS3ListObjectsOutput {
                if let contents = listOutput.contents as [AWSS3Object]?
                {
                    completionKey(keys: contents)
                }
            }
            return nil
        })
    }
    
    func getSubHero(type: String) -> SubHero
    {
        self._prefix = type + "/Hero/"
        
        
        //get listings
        let subListings = getListObj()
        
        //setdownReq
        let subReq = setDownloadReq(subListings)
        var main: ThumbNail?
        
        for req in subReq{
            let url = downLoad(req)
            
            main = ThumbNail(title: req.key!, description: type + " Main Hero", key: req.key!, picture: UIImage(contentsOfFile: url.path!)!)
            
        }
        
        self._prefix = type + "/SubHero/"
        
        
        //get listings
        let subSubListings = getListObj()
        
        //setdownReq
        let subSubReq = setDownloadReq(subSubListings)
        
        var subList: [ThumbNail] = [ThumbNail]()
        
        for subr in subSubReq{
            let urlS = downLoad(subr)
            
            subList.append( ThumbNail(title: subr.key!, description: type + " Main Hero", key: subr.key!, picture: UIImage(contentsOfFile: urlS.path!)!))
            
        }
        
        return SubHero(cType: type, hero: main!, subHero: subList)
        
    }
    
    func GetMainPage() -> MainPageContent{
        
        var content: MainPageContent?
        var mainHero: [ThumbNail] = [ThumbNail]()
        var subHeros: [SubHero] = [SubHero]()
        
        //Get Main Hero Content
        //set prefix
        self._prefix = "Hero/"
        //get listing
        let mainHerolistings: [AWSS3Object] = getListObj()
        //set downreq
        let mainHeroDownReq: [AWSS3TransferManagerDownloadRequest] = setDownloadReq(mainHerolistings)
        
        //download listings
        
        for req in mainHeroDownReq
        {
            //create objects
            let url = downLoad(req)
            
            mainHero.append(ThumbNail(title: req.key!, description: "Tester", key: req.key!, picture: UIImage(contentsOfFile: url.path!)!))
        }
        
        //GetSub Hero Content From each content type
        
        let start: Int = 0
        
        //for loop
        while start < 3
        {
            var type: String = ""
            //set prefix for content
            
            if(start == 0 ){
                type = "Read"
                subHeros.append(getSubHero(type))
            }
            else if (start == 1)
            {
                type = "Learn"
                subHeros.append(getSubHero(type))
            }
            else
            {
                type = "Watch"
                subHeros.append(getSubHero(type))
            }
        
            //create objects
        }
        
        content = MainPageContent(heros: mainHero, sub: [Content](), contSub: subHeros)
        
        //return main page 
        
        return content!
    }
    
    func downLoad(downReq: AWSS3TransferManagerDownloadRequest) -> NSURL
    {
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        
        var downLoadPath: NSURL?
        
        transferManager.download(downReq).continueWithBlock({(task) -> AnyObject! in
            if let error = task.error{
                if error.domain == AWSS3TransferManagerErrorDomain as String
                    && AWSS3TransferManagerErrorType(rawValue: error.code) == AWSS3TransferManagerErrorType.Paused{
                    print ("DownLoad Paused")
                }else{
                    print("DownLoad Failed: [\(error)]")
                }
            }
            else if let exception = task.exception
            {
                print("download failed: [\(exception)]")
            }
            else{
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    downLoadPath = downReq.downloadingFileURL
                })
            }
            return downLoadPath
        })
        return downLoadPath!
    }
    
    func setDownloadReq(s3Obj: [AWSS3Object]) -> [AWSS3TransferManagerDownloadRequest]
    {
        var reqList: [AWSS3TransferManagerDownloadRequest] = [AWSS3TransferManagerDownloadRequest]()
        
        
        for s3 in s3Obj{
            let downFileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("download").URLByAppendingPathComponent(s3.key!)
            let downFilePath = downFileURL.path!
            
            if NSFileManager.defaultManager().fileExistsAtPath(downFilePath){
                //reqList.append(nil)
                print("Error getting download request file path exists")
            }
            else
            {
                let downReq = AWSS3TransferManagerDownloadRequest()
                downReq.bucket = "contentmediaapp"
                downReq.key = s3.key
                downReq.downloadingFileURL = downFileURL
                
                reqList.append(downReq)
            }
        }
        
        return reqList
    }
    /*
    func getKeys(){
        let listObjectsRequest = AWSS3ListObjectsRequest()
        listObjectsRequest.bucket = "contentmediaapp"
        listObjectsRequest.delimiter = "/"
        listObjectsRequest.prefix = self._prefix
        
        self._s3.listObjects(listObjectsRequest).continueWithBlock({(task) -> AnyObject! in
            if let error = task.error{
                print("List objects Failed: [\(error)]")
            }
            if let exception = task.exception {
                print("list objects failed: [\(exception)]")
            }
            
            if let listOutput = task.result as? AWSS3ListObjectsOutput {
                if let contents = listOutput.contents! as? [AWSS3Object]
                {
                    
                }
            }
            return nil
        })
    }*/
    
    
    func getListObj() -> [AWSS3Object] {
        let listObjectsRequest = AWSS3ListObjectsRequest()
        listObjectsRequest.bucket = "contentmediaapp"
        listObjectsRequest.delimiter = "/"
        listObjectsRequest.prefix = self._prefix
        
        self._s3.listObjects(listObjectsRequest).continueWithBlock({(task) -> AnyObject! in
            if let error = task.error{
                print("List objects Failed: [\(error)]")
            }
            if let exception = task.exception {
                print("list objects failed: [\(exception)]")
            }
            
            if let listOutput = task.result as? AWSS3ListObjectsOutput {
                if let contents = listOutput.contents! as? [AWSS3Object]
                {
                    return contents
                }
            }
            return nil
        })
        return [AWSS3Object]()
    }
    
    
    func testGet()
    {
        let downloadURL = NSTemporaryDirectory().stringByAppendingString("ronswanson.jpg")
        let tempURL = NSURL(fileURLWithPath: downloadURL)
        
        let downloadReq: AWSS3TransferManagerDownloadRequest = AWSS3TransferManagerDownloadRequest()
        
        downloadReq.bucket = "contentmediaapp"
        downloadReq.key = "ronswanson.jpg"
        
        
        downloadReq.downloadingFileURL = tempURL
        var selectedImage: UIImage?
        
        let task = self._transferManager.download(downloadReq)
        task.continueWithBlock { (task: AWSTask) -> AnyObject! in
            print(task.error)
            if task.error != nil {
                print("GAHH")
            } else {
                dispatch_async(dispatch_get_main_queue()
                    , {
                        selectedImage = UIImage(contentsOfFile: downloadURL)!

                        
                })
    
                if((task.result) != nil){
                    var down:AnyObject? = task.result
                    
                    
                }
            }
            return nil
        }

    }
    
    func getUrlKeyDict() -> [String: String]
    {
        return self._urlKey
    }
    
}
