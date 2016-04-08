//
//  GetSingleContent.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/8/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation


class GetSingleContent {
    
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
    
    func createContent(url: NSURL, type: String, cont: Content ) -> Content?
    {
        do
        {
        let txt: String = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            
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
    
    func setRequest(key: String) -> AWSS3TransferManagerDownloadRequest
    {
        var str: String = key
        var downReq: AWSS3TransferManagerDownloadRequest = AWSS3TransferManagerDownloadRequest()
        
        if(str.lowercaseString.rangeOfString("/") != nil)
        {
            str = str.stringByReplacingOccurrencesOfString("/", withString: "+")
        }
        
        let downFileURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(str)
        
        if NSFileManager.defaultManager().fileExistsAtPath(downFileURL.path!){
            //reqList.append(nil)
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