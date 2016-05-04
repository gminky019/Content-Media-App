//
//  GetContentPages.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/23/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    Description: 
 
    This class is the clss that handles the generation and downloading for each specific content page.
    i.e. Read watch learn. 
 
    This class follows similar download patterns but uses separate bucktes and processing to download and handle page
    generation. 
 
 */

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
    
    // This method is a method ot set the global type variable
    func setType(typer: String)
    {
        self._Type = typer
    }
    // This method is used to set the global hero variable to false
    func setHero()
    {
        self._HeroPage = false
    }
    
    //Set key will set the key of the method determined by the global type variable
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
        case "Video":
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
    
    //This returns the global dctionary for the keys
   public func getKeyStuff() -> [NSURL: [String: String]]
    {
        return self._s3Holder
    }
    
    /*
        This method retrieves the keys for the specific peice of data we are trying to retrieve. 
     
        Since the keys can be different from the keys in the object you need to still retrieve the object by using the prefix setting in aws. 
     
        This method will return a list of objects to download.
    */
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
    
    //This method will set the aws request for each s3 key that was retrieved from aws.
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
    
    //This is the download method that will dowbnload a single piece of content from the aws database.
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
    
    //This is a helper method that parses the titles from the given key and returns the title
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
    
    //This is the main abstarcted method that will generate the download for the main content pages.
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
    
    /*
        This is another abstracted method that will handle the multiple asyncrounous download requests and manages them accordingly using dispatch groups. 
    */
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