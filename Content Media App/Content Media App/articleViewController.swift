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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.articleAuthorDate.text = " "
        let accessViewController: ViewController = ViewController(nibName: nil, bundle: nil)
        
        /*var tempCont : Content = Content(title: "Test Art", description: "My Test Art", key: "/dolphins-_communication_with_sonar")
        var integrate: MiddleIntegration = MiddleIntegration()
        
        var realArt: ArticleObj?
        integrate.getContent(tempCont){
            (retContent: Content) in
            realArt = retContent as! ArticleObj
            
         self.articleText.text = realArt?.text
        }*/
            

        
        switch article {
        case "Hero One":
            self.articleImage.image = accessViewController.imageHeroOne
            articleType.text = accessViewController.typeHeroOne
            articleTitle.text = accessViewController.titleHeroOne
            articleText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc urna nulla, ultricies id cursus nec, porta at eros. Nulla risus odio, ultrices vitae ipsum sit amet, fringilla egestas dolor. Fusce ornare nulla sit amet nunc suscipit laoreet. Quisque viverra, tortor vel rutrum convallis, nulla eros ornare metus, quis facilisis justo quam eget ex. Integer feugiat efficitur urna malesuada dapibus. Etiam aliquam lectus leo, tempus porttitor turpis suscipit eget. Duis accumsan tortor ut ligula dictum, vitae rutrum metus vestibulum. Pellentesque ultricies metus nunc, in congue mauris vestibulum eget. Praesent congue ac neque in suscipit. Vivamus blandit ultrices nulla sed consectetur. Vestibulum ac ornare dui. Praesent id lorem hendrerit justo vehicula pulvinar. Aenean pharetra volutpat sapien, quis molestie mauris ullamcorper vel. Sed dui sapien, laoreet non enim ac, aliquet accumsan metus. Pellentesque consectetur tristique arcu at fringilla."
            // Insert Author Here
        case "Hero Two":
            articleImage.image = accessViewController.imageHeroTwo
            articleType.text = accessViewController.typeHeroTwo
            articleTitle.text = accessViewController.titleHeroTwo
        case "Hero Three":
            articleImage.image = accessViewController.imageHeroThree
            articleType.text = accessViewController.typeHeroThree
            articleTitle.text = accessViewController.titleHeroThree
        case "Article One":
            articleImage.image = accessViewController.imageArticleOne
            articleType.text = accessViewController.typeArticleOne
            articleTitle.text = accessViewController.titleArticleOne
        case "Article Two":
            articleImage.image = accessViewController.imageArticleTwo
            articleType.text = accessViewController.typeArticleTwo
            articleTitle.text = accessViewController.titleArticleTwo
        case "Article Three":
            articleImage.image = accessViewController.imageArticleThree
            articleType.text = accessViewController.typeArticleThree
            articleTitle.text = accessViewController.titleArticleThree
        case "Article Four":
            articleImage.image = accessViewController.imageArticleFour
            articleType.text = accessViewController.typeArticleFour
            articleTitle.text = accessViewController.titleArticleFour
        case "Watch Hero":
            articleImage.image = accessViewController.imageWatchHero
            articleType.text = accessViewController.typeWatchHero
            articleTitle.text = accessViewController.titleWatchHero
        case "Watch Article One":
            articleImage.image = accessViewController.imageWatchArticleOne
            articleType.text = accessViewController.typeWatchArticleOne
            articleTitle.text = accessViewController.titleWatchArticleOne
        case "Watch Article Two":
            articleImage.image = accessViewController.imageWatchArticleTwo
            articleType.text = accessViewController.typeWatchArticleTwo
            articleTitle.text = accessViewController.titleWatchArticleTwo
        case "Read Hero":
            articleImage.image = accessViewController.imageReadHero
            articleType.text = accessViewController.typeReadHero
            articleTitle.text = accessViewController.titleReadHero
        case "Read Article One":
            articleImage.image = accessViewController.imageReadArticleOne
            articleType.text = accessViewController.typeReadArticleOne
            articleTitle.text = accessViewController.titleReadArticleOne
        case "Read Article Two":
            articleImage.image = accessViewController.imageReadArticleTwo
            articleType.text = accessViewController.typeReadArticleTwo
            articleTitle.text = accessViewController.titleReadArticleTwo
        case "Learn Hero":
            articleImage.image = accessViewController.imageLearnHero
            articleType.text = accessViewController.typeLearnHero
            articleTitle.text = accessViewController.titleLearnHero
        case "Learn Article One":
            articleImage.image = accessViewController.imageLearnArticleOne
            articleType.text = accessViewController.typeLearnArticleOne
            articleTitle.text = accessViewController.titleLearnArticleOne
        case "Learn Article Two":
            articleImage.image = accessViewController.imageLearnArticleTwo
            articleType.text = accessViewController.typeLearnArticleTwo
            articleTitle.text = accessViewController.titleLearnArticleTwo
        case "Shop Hero":
            articleImage.image = accessViewController.imageShopHero
            articleType.text = accessViewController.typeShopHero
            articleTitle.text = accessViewController.titleShopHero
        case "Shop Article One":
            articleImage.image = accessViewController.imageShopArticleOne
            articleType.text = accessViewController.typeShopArticleOne
            articleTitle.text = accessViewController.titleShopArticleOne
        case "Shop Article Two":
            articleImage.image = accessViewController.imageShopArticleTwo
            articleType.text = accessViewController.typeShopArticleTwo
            articleTitle.text = accessViewController.titleShopArticleTwo
        default:
            articleType.text = "ERROR"
            articleTitle.text = "Error: Unexpected Error has Occured"
        }
            
        

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
    
}