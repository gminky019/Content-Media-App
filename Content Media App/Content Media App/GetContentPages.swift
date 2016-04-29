//
//  GetContentPages.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/23/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

public class GetContentPages {
    
    var _Type:String
    var _KeyVal : String?
    var _CurrKeys : [AWSS3Object]
    let _S3 : AWSS3
    var _ContentCounter: Int
    var _HeroPage: Bool
    var _arrayHolder: [NSURL]
    var _heroA : [NSURL]
    var _nonA: [NSURL]
    var _s3Holder: [NSURL: [String: String]]
    
    init()
    {
        self._Type = "None"
        self._CurrKeys = [AWSS3Object] ()
        self._S3 = AWSS3.defaultS3()
        self._ContentCounter = 0
        self._HeroPage = false
        self._arrayHolder = [NSURL] ()
        self._nonA = [NSURL]()
        self._heroA = [NSURL]()
        self._s3Holder = [NSURL:[String: String]]()
    }
    
    func setType(typer: String)
    {
        self._Type = typer
    }
    func setHero()
    {
        self._HeroPage = false
    }
    
    func setKey ()
    {
        self._KeyVal = "/"
        switch self._Type {
        case "Read":
            self._KeyVal = "read"
        case "Learn":
            self._KeyVal = "learn"
        case "Shop":
            self._KeyVal = "shop"
        case "Watch":
            self._KeyVal = "watch"
            
        default:
            break
        }
        self._KeyVal = self._KeyVal! + "/"
        
        /*
        if(self._HeroPage)
        {
            self._KeyVal = self._KeyVal! + "/"
            self._KeyVal = self._KeyVal! + "hero"
            self._KeyVal = self._KeyVal! + "/"
            self._HeroPage = false
        }
        else
        {
            self._KeyVal = self._KeyVal! + "/"
            self._KeyVal = self._KeyVal! + "non"
            self._KeyVal = self._KeyVal! + "/"
        }*/
    }
    
   public func getKeyStuff() -> [NSURL: [String: String]]
    {
        return self._s3Holder
    }
    
    func getKeys(complete: (completion: [AWSS3Object]) -> ())
    {
        let keyReq: AWSS3ListObjectsRequest = AWSS3ListObjectsRequest()
        
        keyReq.bucket = "cmacontentpages"
        //keyReq.delimiter = "/"
        keyReq.prefix = self._KeyVal
        
        self._S3.listObjects(keyReq).continueWithSuccessBlock({(task) -> AnyObject! in
            if let error = task.error{
                print("List objects Failed: [\(error)]")
            }
            if let exception = task.exception {
                print("list objects failed: [\(exception)]")
            }
            
            if let listOutput = task.result as? AWSS3ListObjectsOutput {
                if let contents = listOutput.contents as [AWSS3Object]?
                {
                    complete(completion: contents)
                }
            }
            return nil
            
        })
    }
    
    func setRequest()-> [AWSS3TransferManagerDownloadRequest]
    {
        var reqs: [AWSS3TransferManagerDownloadRequest] = [AWSS3TransferManagerDownloadRequest]()
        
        for s3 in self._CurrKeys
        {
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
           // self._urlKey[downFileURL.path!] = s3.key
            if NSFileManager.defaultManager().fileExistsAtPath(tempURL.path!){
                //reqList.append(nil)
                print("Error getting download request file path exists")
            }
            else
            {
                let downReq = AWSS3TransferManagerDownloadRequest()
                downReq.bucket = "cmacontentpages"
                downReq.key = s3.key
                downReq.downloadingFileURL = downFileURL
                
                reqs.append(downReq)
            }
            
            //downloadURL = nil
            // rempurl = ni
        }
        
        
        return reqs
    }
    
    func downloadContent(downReq: AWSS3TransferManagerDownloadRequest, group: dispatch_group_t, completionDown: (compl: NSURL )-> ())
    {
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        
        
        var downLoadPath: NSURL?
        transferManager.download(downReq).continueWithBlock({(task) -> AnyObject! in
            if let error = task.error{
                if error.domain == AWSS3TransferManagerErrorDomain as String
                    && AWSS3TransferManagerErrorType(rawValue: error.code) == AWSS3TransferManagerErrorType.Paused{
                    // dispatch_group_leave(group)
                    print ("DownLoad Paused")
                }else{
                    
                    dispatch_group_leave(group)
                    
                    print("FAILED ON  " + downReq.key! + "\n")
                    print("DownLoad Failed: [\(error)]" + "\n\n")
                }
            }
            else if let exception = task.exception
            {
                //dispatch_group_leave(group)
                print("download failed: [\(exception)]")
            }
            else{
                
                // dispatch_group_leave(group)
                
                
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    
                    print("SUCCESS ON  " + downReq.key! + "\n\n")
                    downLoadPath = downReq.downloadingFileURL
                    
                    dispatch_group_leave(group)
                    
                    var tempH: [String: String] = [String:String]()
                    
                    tempH["key"] = downReq.key
                    tempH["title"] = self.parseTitleFromKey(downReq.key!)
                    
                    self._s3Holder[downLoadPath!] = tempH
                    
                    completionDown(compl: downLoadPath!)
                })
            }
            //   dispatch_group_leave(group)
            return nil
        })
    }
    
    func parseTitleFromKey(key: String) -> String
    {
        let temp: String = key
        
        let tempArr: [String] = temp.characters.split{$0 == "/"}.map(String.init)
        
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
    
    
    func getContentMain( type: String, complet: (loc: [String : [NSURL]]) -> ())
    {
        setType(type)
        setHero()
        setKey()
        
        getKeys() {(completion: [AWSS3Object]) in
            self._CurrKeys = completion
            
            let requests: [AWSS3TransferManagerDownloadRequest] = self.setRequest()
            
            self.multiDownloadHandler(requests) { (locs: [String: [NSURL]]) in
                complet(loc: locs)
            }
        }
    }
    func multiDownloadHandler(reqs: [AWSS3TransferManagerDownloadRequest], complete: (locs: [String: [NSURL]])-> ())
    {
        var count : Int = 0
        let firstGroup = dispatch_group_create()
        
        var hero : [NSURL] = [NSURL]()
        
        var non: [NSURL] = [NSURL]()
        
        var arrUrl : [NSURL]
        
        for r in reqs
        {
            var fileType: String = ""
            if (count < 4)
            {
                fileType = "Hero"
                arrUrl = hero
            }
            else
            {
                fileType = "non"
                arrUrl = non
            }
            
            count = count + 1
            
            dispatch_group_enter(firstGroup)
            
            
            self.downloadContent(r, group: firstGroup){ (compl: NSURL) in
              //  arrUrl.append(compl)
                
            //  self._arrayHolder.append(compl)
                
                
                
                if(fileType == "Hero")
                {
                    self._heroA.append(compl)
                }
                else{
                    self._nonA.append(compl)
                }
                
            }
        }
        dispatch_group_notify(firstGroup, dispatch_get_main_queue()){
            
            var dict: [String: [NSURL]]  = [String: [NSURL]] ()
            
            dict["Hero"] = self._heroA
            dict["Non"] = self._nonA
            
            complete(locs: dict)
        }
    }
    
    
}