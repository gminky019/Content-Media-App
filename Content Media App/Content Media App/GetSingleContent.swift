//
//  GetSingleContent.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/8/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//
/*
    This class is the class that is used to get a single piece of content. 
 
    Single Piece of content means either a single article or video. 
 
    It has similar functionality to the Connect to AWS class as the process is vbery similar. 
 
    This class instead grabs from a different bucket using the keys given from middle ware and then finds the content to pass back the proper data
 */

import Foundation


class GetSingleContent {
    
    
    /*
        This is the method that returns after completion a piece of article content. 
     
        It takes the type and the key. Using these to download the proper data from aws and creating a content class out of it.
    */
    func getContent(key: String, type: String, cont: Content, complete: (single: Content)-> ())
    {
        let request : AWSS3TransferManagerDownloadRequest = self.setRequest(key)
        
        var urlContent: NSURL?
        var single: Content?
        
        self.downLoad(request){ (url: NSURL) in
            urlContent = url
            single = self.createContent(url, type: type, cont: cont) as! ArticleObj
            (complete(single: single!))
        }
    }
    
    /*
        This is the same as the method above as it is called to get a single piece of vdeo content from aws. 
     
        This method will return the url to the video to the calling function.
    */
    func getVideoContent(key: String, type: String, cont: Content, complete: (single: String)-> ())
    {
        let req: AWSS3TransferManagerDownloadRequest = self.setRequest(key)
        
        var urlContent: NSURL?
        var single: String?
        
        self.downLoad(req){ (url: NSURL) in
            urlContent = url
            (complete(single: self.getVideoUrl(url)))
        }
    }
    
    /*
        This is a helper method that will convert the NSURL to the actuall url needed by the integation layer
     
        Returning a string of the url
    */
    func getVideoUrl(url: NSURL) -> String
    {
        var txt: String?
        
        do {
            txt = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding) as String
        }
        catch {/* error handling here */}
        
        return txt!
    }
    
    /*
        this method is a helper method that takes the url returned from aws that is now local and converts the content to the article content object. 
     
        Returns the article content object
    */
    func createContent(url: NSURL, type: String, cont: Content ) -> Content?
    {
        do
        {
        let txt: String = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding) as String
            
            let singleCont: ArticleObj = ArticleObj(title: cont.title, description: cont.description, key: cont.awskey, article: txt, author: "Garrett Minky")
            
            return singleCont
        }
        catch let error as NSError{
            print("Error: \(error)")
        }
            return nil
        /*
        switch type{
            case "read":
            
            case "watch":
                break
            case "learn":
            
            
            case "main":
                break
            case "shop":
                break
        default:
            break
        }
         */
        
    }
    
    /*
        This is the method that creates the request object needed for downloading. 
     
        A special piece of this function is that to not overwrite current files in the application it tkes a random number generator and appends that number to the file path creating a new file. 
     
        Returns: AWSS3TransferDownloadRequest
    */
    func setRequest(key: String) -> AWSS3TransferManagerDownloadRequest
    {
        var str: String = key
        let r = Int(arc4random_uniform(1000000) + 1)
        
        str = String(r)  + str
        var downReq: AWSS3TransferManagerDownloadRequest = AWSS3TransferManagerDownloadRequest()
        
        if(str.lowercaseString.rangeOfString("/") != nil)
        {
            str = str.stringByReplacingOccurrencesOfString("/", withString: "+")
        }
        
        var downFileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(str)
        
        if NSFileManager.defaultManager().fileExistsAtPath(downFileURL.path!){
            //reqList.append(nil)
          //  let r : Int32 = rand()
            //downFileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent("temp" + String(r) + str)
            print("Error getting download request file path exists")
        }
        else
        {
            downReq.bucket = "cmacontent"
            downReq.key = key
            downReq.downloadingFileURL = downFileURL
            
            
        }
    
        return downReq
    }
    
    
    /*
        This is the download completion handler method that takes the request and downloads the single object 
     
        returning on completion. 
    */
    func downLoad(downReq: AWSS3TransferManagerDownloadRequest, completionDown: (url: NSURL) ->())
    {
        let transferManager = AWSS3TransferManager.defaultS3TransferManager()
        
        var downLoadPath: NSURL?
        
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
                
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    
                    print("SUCCESS ON  " + downReq.key! + "\n\n")
                    downLoadPath = downReq.downloadingFileURL
                    
                    completionDown(url: downLoadPath!)
                })
            }
            return nil
        })
        
    }
}