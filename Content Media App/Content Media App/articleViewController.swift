//
//  articleViewController.swift
//  Content Media App
//
//  Created by Jordan Harris on 3/29/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit


class articleViewController: UIViewController {
    
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleType: UITextView!
    
    @IBOutlet weak var articleTitle: UITextView!
    
    @IBOutlet weak var articleAuthorDate: UITextView!
    
    
    @IBOutlet weak var articleText: UITextView!
    
    var article = String()
    
    var articleThumbnail: ThumbNail!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Declarations
        self.articleAuthorDate.text = " "
        let accessViewController: ViewController = ViewController(nibName: nil, bundle: nil)
        
        var integrate: MiddleIntegration = MiddleIntegration()
        
        
        var tempK: String = self.stripKey(self.articleThumbnail.awskey)
        
        var tempCont = Content(title: self.articleThumbnail.title, description: self.articleThumbnail.description, key: tempK )
        
        // Load Content into articles
        var realArt: ArticleObj?
        integrate.getContent(tempCont){
            (retContent: Content) in
            realArt = retContent as! ArticleObj
            
         self.articleText.text = realArt?.text
            
        self.articleText.font = UIFont(name: "PlayfairDisplay-Regular", size: 16)
        self.articleText.textColor = UIColor.blackColor()
        self.articleText.textAlignment = NSTextAlignment.Justified
            
        }
        
        self.articleImage.image = articleThumbnail.pic
        self.articleTitle.text = articleThumbnail.title
        self.articleType.text = "READ"
    
        // Format text view title to correct size 
        
        let contentSize = articleTitle.sizeThatFits(articleTitle.bounds.size)
        
        var frameTitle = articleTitle.frame
        frameTitle.size.height = contentSize.height
        articleTitle.frame = frameTitle
        
        var frameText = articleText.frame
        frameText.size.height = contentSize.height
        articleText.frame = frameText
        
        
        // Format Fonts
        
        let typeColor = UIColor.init(red: 221/255, green: 180/255, blue: 0/255, alpha: 1)
        
        articleTitle.font = UIFont(name: "Roboto-Bold", size: 28)
        articleTitle.textColor = UIColor.blackColor()
        
        articleType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleType.textColor = typeColor
        
        articleText.font = UIFont(name: "PlayfairDisplay-Regular", size: 14)
        articleText.textColor = UIColor.blackColor()
        articleText.textAlignment = NSTextAlignment.Justified
        
        
    
    }
    
    // Strip the "key" so that it is formatted correctly 
    func stripKey(temp: String) -> String{
        let tempArr: [String] = temp.characters.split{$0 == "/"}.map(String.init)
        
        let count : Int = tempArr.count
        
        if(count != 0)
        {
            var final: String = tempArr[count-1]
            
            final = "/" + final
            
            return final
        }
        else
        {
            return "BAD SPlitting "
        }
    }
    
    
}