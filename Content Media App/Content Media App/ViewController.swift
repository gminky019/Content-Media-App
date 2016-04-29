//
//  ViewController.swift
//  Content Media App
//
//  Created by Garrett Minky on 2/27/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import QuartzCore
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var heroOneView: UIImageView!
    @IBOutlet weak var heroTwoView: UIImageView!
    @IBOutlet weak var heroThreeView: UIImageView!

    @IBOutlet weak var heroOneTitle: UITextView!
    @IBOutlet weak var heroTwoTitle: UITextView!
    @IBOutlet weak var heroThreeTitle: UITextView!
    
    @IBOutlet weak var heroOneType: UITextView!
    @IBOutlet weak var heroTwoType: UITextView!
    @IBOutlet weak var heroThreeType: UITextView!
    
    @IBOutlet weak var heroOneIcon: UIImageView!
    @IBOutlet weak var heroTwoIcon: UIImageView!
    @IBOutlet weak var heroThreeIcon: UIImageView!
    
    @IBOutlet weak var articleOne: UIImageView!
    @IBOutlet weak var articleTwo: UIImageView!
    @IBOutlet weak var articleThree: UIImageView!
    @IBOutlet weak var articleFour: UIImageView!
    
    @IBOutlet weak var articleOneType: UITextView!
    @IBOutlet weak var articleTwoType: UITextView!
    @IBOutlet weak var articleThreeType: UITextView!
    @IBOutlet weak var articleFourType: UITextView!
    
    @IBOutlet weak var articleOneTitle: UITextView!
    @IBOutlet weak var articleTwoTitle: UITextView!
    @IBOutlet weak var articleThreeTitle: UITextView!
    @IBOutlet weak var articleFourTitle: UITextView!
    
    @IBOutlet weak var articleOneIcon: UIImageView!
    @IBOutlet weak var articleTwoIcon: UIImageView!
    @IBOutlet weak var articleThreeIcon: UIImageView!
    @IBOutlet weak var articleFourIcon: UIImageView!
    
    @IBOutlet weak var watchHero: UIImageView!
    @IBOutlet weak var watchHeroTitle: UITextView!
    @IBOutlet weak var watchHeroType: UITextView!
    @IBOutlet weak var watchHeroIcon: UIImageView!
    
    @IBOutlet weak var watchArticleOne: UIImageView!
    @IBOutlet weak var watchArticleTwo: UIImageView!
    
    @IBOutlet weak var watchArticleOneType: UITextView!
    @IBOutlet weak var watchArticleTwoType: UITextView!
    
    @IBOutlet weak var watchArticleOneTitle: UITextView!
    @IBOutlet weak var watchArticleTwoTitle: UITextView!
    
    @IBOutlet weak var watchArticleOneIcon: UIImageView!
    @IBOutlet weak var watchArticleTwoIcon: UIImageView!
    
    @IBOutlet weak var readHero: UIImageView!
    @IBOutlet weak var readHeroTitle: UITextView!
    @IBOutlet weak var readHeroType: UITextView!
    @IBOutlet weak var readHeroIcon: UIImageView!
    
    @IBOutlet weak var readArticleOne: UIImageView!
    @IBOutlet weak var readArticleTwo: UIImageView!
    
    @IBOutlet weak var readArticleOneType: UITextView!
    @IBOutlet weak var readArticleTwoType: UITextView!
    
    @IBOutlet weak var readArticleOneTitle: UITextView!
    @IBOutlet weak var readArticleTwoTitle: UITextView!
    
    @IBOutlet weak var readArticleOneIcon: UIImageView!
    @IBOutlet weak var readArticleTwoIcon: UIImageView!
    
    @IBOutlet weak var learnHero: UIImageView!
    @IBOutlet weak var learnHeroTitle: UITextView!
    @IBOutlet weak var learnHeroType: UITextView!
    @IBOutlet weak var learnHeroIcon: UIImageView!
    
    @IBOutlet weak var learnArticleOne: UIImageView!
    @IBOutlet weak var learnArticleTwo: UIImageView!
    

    @IBOutlet weak var learnArticleOneType: UITextView!
    @IBOutlet weak var learnArticleTwoType: UITextView!
    
    @IBOutlet weak var learnArticleOneTitle: UITextView!
    @IBOutlet weak var learnArticleTwoTitle: UITextView!
    
    @IBOutlet weak var learnArticleOneIcon: UIImageView!
    @IBOutlet weak var learnArticleTwoIcon: UIImageView!
    
    @IBOutlet weak var watchLabel: UITextView!
    @IBOutlet weak var readLabel: UITextView!
    @IBOutlet weak var learnLabel: UITextView!
    @IBOutlet weak var shopLabel: UITextView!

    
    @IBOutlet weak var shopHero: UIImageView!
    @IBOutlet weak var shopHeroTitle: UITextView!
    @IBOutlet weak var shopHeroType: UITextView!
    @IBOutlet weak var shopHeroIcon: UIImageView!
    
    @IBOutlet weak var shopArticleOne: UIImageView!
    @IBOutlet weak var shopArticleTwo: UIImageView!
    
    @IBOutlet weak var shopArticleOneType: UITextView!
    @IBOutlet weak var shopArticleTwoType: UITextView!
    
    @IBOutlet weak var shopArticleOneTitle: UITextView!
    @IBOutlet weak var shopArticleTwoTitle: UITextView!
    
    @IBOutlet weak var shopArticleOneIcon: UIImageView!
    @IBOutlet weak var shopArticleTwoIcon: UIImageView!
    
    @IBOutlet weak var footerImageOne: UIImageView!
    @IBOutlet weak var footerImageTwo: UIImageView!
    @IBOutlet weak var footerImageThree: UIImageView!
    @IBOutlet weak var footerImageFour: UIImageView!
    @IBOutlet weak var footerBackground: UIImageView!
    
    
    var articleClicked = "null"
    
    // Hero Articles

    var contDict: [String: ThumbNail] = [String: ThumbNail]()
    var passedThumbnail: ThumbNail!
    
    
    var imageHeroOne = UIImage (named: "tempHeroOne.jpg")
    var titleHeroOne = "Ice Melting In Arctic: How can you save the polar bears?"
    var typeHeroOne = "READ"
    
    var imageHeroTwo = UIImage (named: "tempHeroTwo.jpg")
    var titleHeroTwo = "Monkeys of the Jungle"
    var typeHeroTwo = "READ"
    
    var imageHeroThree = UIImage (named: "tempHeroThree.jpg")
    var titleHeroThree = "Dolphins: Communication with Sonar"
    var typeHeroThree = "LEARN"
    
    // Featured Articles 
    
    var imageArticleOne = UIImage (named: "tempArtOne.jpg")
    var titleArticleOne = "Jungle Book: Out Now, and it's good!"
    var typeArticleOne = "READ"

    var imageArticleTwo = UIImage (named: "tempArtTwo.jpg")
    var titleArticleTwo = "The Incredibly Diverse Ecosystem in Just This River Will Blow Your Mind"
    var typeArticleTwo = "LEARN"
    
    var imageArticleThree = UIImage (named: "bb8.png")
    var titleArticleThree = "BB8 Saves The Day"
    var typeArticleThree = "WATCH"
    
    var imageArticleFour = UIImage (named: "kyloren.png")
    var titleArticleFour = "Learn The Dark Side of The Force with Kylo Ren"
    var typeArticleFour = "LEARN"
    
    // Watch Articles 
    
    var imageWatchHero = UIImage(named: "MileniumFalcon.png")
    var titleWatchHero = "Millennium Falcon: Kessel Run in 12 Parsecs"
    var typeWatchHero = "RE/MX"
    
    var imageWatchArticleOne = UIImage(named: "DarthMal.png")
    var titleWatchArticleOne = "Darth Mal: What was his downfall?"
    var typeWatchArticleOne = "WATCH"
    
    var imageWatchArticleTwo = UIImage(named: "r2d2.png")
    var titleWatchArticleTwo = "Why didn't R2D2 give up the map earlier?"
    var typeWatchArticleTwo = "RE/MX"
    
    // Read Articles 
    
    var imageReadHero = UIImage(named: "DarthMal.png")
    var titleReadHero = "Darth Mal: What was his downfall?"
    var typeReadHero = "RE/MX"
    
    var imageReadArticleOne = UIImage(named: "r2d2.png")
    var titleReadArticleOne = "Why didn't R2D2 give up the map earlier?"
    var typeReadArticleOne = "WATCH"
    
    var imageReadArticleTwo = UIImage(named: "MileniumFalcon.png")
    var titleReadArticleTwo = "Millennium Falcon: Kessel Run in 12 Parsecs"
    var typeReadArticleTwo = "RE/MX"
    
    // Learn Articles
    
    var imageLearnHero = UIImage(named: "r2d2.png")
    var titleLearnHero = "Why didn't R2D2 give up the map earlier?"
    var typeLearnHero = "RE/MX"
    
    var imageLearnArticleOne = UIImage(named: "DarthMal.png")
    var titleLearnArticleOne = "Darth Mal: What was his downfall?"
    var typeLearnArticleOne = "WATCH"
    
    var imageLearnArticleTwo = UIImage(named: "MileniumFalcon.png")
    var titleLearnArticleTwo = "Millennium Falcon: Kessel Run in 12 Parsecs"
    var typeLearnArticleTwo = "RE/MX"
    
    // Shop Articles
    
    var imageShopHero = UIImage (named: "tempArtTwo.jpg")
    var titleShopHero = "The Incredibly Diverse Ecosystem in Just This River Will Blow Your Mind"
    var typeShopHero = "RE/MX"
    
    var imageShopArticleOne = UIImage(named: "DarthMal.png")
    var titleShopArticleOne = "Darth Mal: What was his downfall?"
    var typeShopArticleOne = "WATCH"
    
    var imageShopArticleTwo = UIImage(named: "MileniumFalcon.png")
    var titleShopArticleTwo = "Millennium Falcon: Kessel Run in 12 Parsecs"
    var typeShopArticleTwo = "RE/MX"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: 86, height: 44))
        let image = UIImage(named: "Logo.png")
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        var overlay : UIView
        //var cdaLogo = UIImage(named: "CDALoadingLogo.png")
        overlay = UIView(frame: view.frame)
        //overlay.backgroundColor = UIColor.whiteColor()
        //overlay.alpha = 1.0
        
        let backgroundOverlay = UIImage(named: "BackgroundImageLoading2.png")
        
        let backgroundView = UIImageView(image: backgroundOverlay)
        
        var activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRectMake(0, 0, 40, 40)
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.center = CGPointMake(overlay.bounds.width / 2, (overlay.bounds.height / 3)*2)
        
        //let logoView = UIImageView(image: cdaLogo)
        
        //logoView.frame = CGRectMake((overlay.bounds.width / 2) - 317/2, (overlay.bounds.height / 7), 317, 400)
        
        backgroundView.addSubview(activityIndicator)
        //overlay.addSubview(activityIndicator)
        //overlay.addSubview(logoView)
        
        view.addSubview(backgroundView)
        
        activityIndicator.startAnimating()
        
        let typeColor = UIColor.init(red: 221/255, green: 180/255, blue: 0/255, alpha: 1)
        
        

        // Navigation
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
       }

        
        
        var mainP: MainPageContent?
        var integrate: MiddleIntegration = MiddleIntegration()
        
        
        
        integrate.getReadPage(){(returned: ContentPage) in
            
            var thatHolder = 0
        }
        
        integrate.getMainPage(){
            (main: MainPageContent) in
            mainP = main
            
            // Hero Articles
            let heroOne = mainP!.hero[0] as! ThumbNail
            let heroTwo = mainP!.hero[1] as! ThumbNail
            let heroThree = mainP!.hero[2] as! ThumbNail
            
            self.contDict["HeroOne"] = heroOne
            self.contDict["HeroTwo"] = heroTwo
            self.contDict["HeroThree"] = heroThree
            
            // Hero One
            self.heroOneView.image = heroOne.pic
            self.imageHeroOne = self.heroOneView.image
            self.heroOneTitle.text = heroOne.title
            self.heroOneTitle.font = UIFont(name: "Roboto-Bold", size: 18)
            self.heroOneTitle.textColor = UIColor.whiteColor()
            
            self.heroOneIcon.image = UIImage(named: "readicon.png")
            
            // Hero Two
            self.heroTwoView.image = heroTwo.pic
            self.heroTwoTitle.text = heroTwo.title
            
            self.heroTwoTitle.font = UIFont(name: "Roboto-Bold", size: 18)
            self.heroTwoTitle.textColor = UIColor.whiteColor()
            
            self.heroTwoIcon.image = UIImage(named: "readicon.png")
            
            // Hero Three
            self.heroThreeView.image = heroThree.pic
            self.heroThreeTitle.text = heroThree.title
            
            self.heroThreeTitle.font = UIFont(name: "Roboto-Bold", size: 18)
            self.heroThreeTitle.textColor = UIColor.whiteColor()
            
            self.heroThreeIcon.image = UIImage(named: "readicon.png")
            
            // Featured Articles
            let featuredOne = mainP!.subHero[0] as! ThumbNail
            let featuredTwo = mainP!.subHero[1] as! ThumbNail
            let featuredThree = mainP!.subHero[2] as! ThumbNail
            let featuredFour = mainP!.subHero[3] as! ThumbNail
            
            self.contDict["featuredOne"] = featuredOne
            self.contDict["featuredTwo"] = featuredTwo
            self.contDict["featuredThree"] = featuredThree
            self.contDict["featuredFour"] = featuredFour
            
            // Featured One
            self.articleOne.image = featuredOne.pic
            self.articleOneTitle.text = featuredOne.title
            
            self.articleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.articleOneTitle.textColor = UIColor.blackColor()
            self.articleOneTitle.textAlignment = .Center
            
            self.articleOneIcon.image = UIImage(named: "readIconSmall.png")
            // Featured Two
            self.articleTwo.image = featuredTwo.pic
            self.articleTwoTitle.text = featuredTwo.title
            
            self.articleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.articleTwoTitle.textColor = UIColor.blackColor()
            self.articleTwoTitle.textAlignment = .Center
            self.articleTwoIcon.image = UIImage(named: "readIconSmall.png")
            // Featured Three
            self.articleThree.image = featuredThree.pic
            self.articleThreeTitle.text = featuredThree.title
            
            self.articleThreeTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.articleThreeTitle.textColor = UIColor.blackColor()
            self.articleThreeTitle.textAlignment = .Center
            
            self.articleThreeIcon.image = UIImage(named: "readIconSmall.png")
            
            // Featured Four
            self.articleFour.image = featuredFour.pic
            self.articleFourTitle.text = featuredFour.title
            
            self.articleFourTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.articleFourTitle.textColor = UIColor.blackColor()
            self.articleFourTitle.textAlignment = .Center
            
            self.articleFourIcon.image = UIImage(named: "readIconSmall.png")
            
            let contentHero:[SubHero] = mainP!.contentHero
            
            for categoryHero in contentHero {
                let mainH :
                    ThumbNail = categoryHero.main as! ThumbNail
                let subC: [Content] = categoryHero.sub
                let sub1: ThumbNail = subC[0] as! ThumbNail
                let sub2: ThumbNail = subC[1] as! ThumbNail
                
                switch categoryHero.type {
                    case "read":
                        self.readHero.image = mainH.pic
                        self.readHeroTitle.text = mainH.title
                        self.readHeroType.text = categoryHero.type
                        self.readHeroIcon.image = UIImage (named: "readicon.png")
                        self.readArticleOne.image = sub1.pic
                        self.readArticleOneTitle.text = sub1.title
                        self.readArticleOneType.text = categoryHero.type
                        self.readArticleOneIcon.image = UIImage (named: "readIconSmall.png")
                        self.readArticleTwo.image = sub2.pic
                        self.readArticleTwoTitle.text = sub2.title
                        self.readArticleTwoType.text = categoryHero.type
                        self.readArticleTwoIcon.image = UIImage (named: "readIconSmall.png")
                    
                        self.contDict["readHero"] = mainH
                        self.contDict["readArticleOne"] = sub1
                        self.contDict["readArticleTwo"] = sub2

                    
                    
                    case "watch":
                        self.watchHero.image = mainH.pic
                        self.watchHeroTitle.text = mainH.title
                        self.watchHeroType.text = categoryHero.type
                        self.watchArticleOne.image = sub1.pic
                        self.watchArticleOneTitle.text = sub1.title
                        self.watchArticleOneType.text = categoryHero.type
                        self.watchArticleTwo.image = sub2.pic
                        self.watchArticleTwoTitle.text = sub2.title
                        self.watchArticleTwoType.text = categoryHero.type
                    
                        self.watchHeroIcon.image = UIImage (named: "playicon.png")
                        self.watchArticleOneIcon.image = UIImage (named: "playiconsmall.png")
                        self.watchArticleTwoIcon.image = UIImage (named: "playiconsmall.png")
                    
                        self.contDict["watchHero"] = mainH
                        self.contDict["watchArticleOne"] = sub1
                        self.contDict["watchArticleTwo"] = sub2
                    
                    
                    case "shop":
                        self.shopHero.image = mainH.pic
                        self.shopHeroTitle.text = mainH.title
                        self.shopHeroType.text = categoryHero.type
                        self.shopArticleOne.image = sub1.pic
                        self.shopArticleOneTitle.text = sub1.title
                        self.shopArticleOneType.text = categoryHero.type
                        self.shopArticleTwo.image = sub2.pic
                        self.shopArticleTwoTitle.text = sub2.title
                        self.shopArticleTwoType.text = categoryHero.type
                    
                        self.shopHeroIcon.image = UIImage (named: "readicon.png")
                        self.shopArticleOneIcon.image = UIImage (named: "readIconSmall.png")
                        self.shopArticleTwoIcon.image = UIImage (named: "readIconSmall.png")
                    
                        self.contDict["shopHero"] = mainH
                        self.contDict["shopArticleOne"] = sub1
                        self.contDict["shopArticleTwo"] = sub2
                    
                    case "learn":
                        self.learnHero.image = mainH.pic
                        self.learnHeroTitle.text = mainH.title
                        self.learnHeroType.text = categoryHero.type
                        self.learnArticleOne.image = sub1.pic
                        self.learnArticleOneTitle.text = sub1.title
                        self.learnArticleOneType.text = categoryHero.type
                        self.learnArticleTwo.image = sub2.pic
                        self.learnArticleTwoTitle.text = sub2.title
                        self.learnArticleTwoType.text = categoryHero.type
                    
                        self.learnHeroIcon.image = UIImage (named: "readicon.png")
                        self.learnArticleOneIcon.image = UIImage (named: "readIconSmall.png")
                        self.learnArticleTwoIcon.image = UIImage (named: "readIconSmall.png")
                    
                        self.contDict["learnHero"] = mainH
                        self.contDict["learnArticleOne"] = sub1
                        self.contDict["learnArticleTwo"] = sub2
                    
                default:
                    break
                    
                }
                
                // Watch 
                
                self.watchHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
                self.watchHeroTitle.textColor = UIColor.whiteColor()
                
                self.watchHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.watchHeroType.textColor = typeColor
                
                self.watchArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.watchArticleOneType.textColor = typeColor
                self.watchArticleOneType.textAlignment = .Center
                
                self.watchArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.watchArticleOneTitle.textColor = UIColor.blackColor()
                self.watchArticleOneTitle.textAlignment = .Center
                
                self.watchArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.watchArticleTwoType.textColor = typeColor
                self.watchArticleTwoType.textAlignment = .Center
                
                self.watchArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.watchArticleTwoTitle.textColor = UIColor.blackColor()
                self.watchArticleTwoTitle.textAlignment = .Center
                
                // Read 
                
                self.readHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
                self.readHeroTitle.textColor = UIColor.whiteColor()
                
                self.readHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.readHeroType.textColor = typeColor
                
                self.readArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.readArticleOneType.textColor = typeColor
                self.readArticleOneType.textAlignment = .Center
                
                self.readArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.readArticleOneTitle.textColor = UIColor.blackColor()
                self.readArticleOneTitle.textAlignment = .Center
                
                self.readArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.readArticleTwoType.textColor = typeColor
                self.readArticleTwoType.textAlignment = .Center
                
                self.readArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.readArticleTwoTitle.textColor = UIColor.blackColor()
                self.readArticleTwoTitle.textAlignment = .Center
                
                // Learn
                
                self.learnHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
                self.learnHeroTitle.textColor = UIColor.whiteColor()
                
                self.learnHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.learnHeroType.textColor = typeColor
                
                self.learnArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.learnArticleOneType.textColor = typeColor
                self.learnArticleOneType.textAlignment = .Center
                
                self.learnArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.learnArticleOneTitle.textColor = UIColor.blackColor()
                self.learnArticleOneTitle.textAlignment = .Center
                
                self.learnArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
                self.learnArticleTwoType.textColor = typeColor
                self.learnArticleTwoType.textAlignment = .Center
                
                self.learnArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
                self.learnArticleTwoTitle.textColor = UIColor.blackColor()
                self.learnArticleTwoTitle.textAlignment = .Center
                
                // Shop
                
                self.shopHeroIcon.image = UIImage (named: "readicon.png")
                self.shopArticleOneIcon.image = UIImage (named: "readIconSmall.png")
                self.shopArticleTwoIcon.image = UIImage (named: "readIconSmall.png")
            }
        backgroundView.removeFromSuperview()
        }
        
        // Hero One Type 
        
        heroOneType.text = typeHeroOne
        heroOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroOneType.textColor = typeColor
        
        // Hero One Tap Gesture Recognizer
        heroOneView.tag = 1
        heroOneView.userInteractionEnabled = true
        let tapRecognizerHeroOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroOneView.addGestureRecognizer(tapRecognizerHeroOne)
        
        // Hero Two Type
        
        heroTwoType.text = typeHeroTwo
        heroTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroTwoType.textColor = typeColor
        
        // Hero Two Tap Gesture Recognizer 
        heroTwoView.tag = 2
        heroTwoView.userInteractionEnabled = true
        let tapRecognizerHeroTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroTwoView.addGestureRecognizer(tapRecognizerHeroTwo)
        
        // Hero Three Type
        
        heroThreeType.text = typeHeroThree
        heroThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroThreeType.textColor = typeColor
        //heroThreeView.addGestureRecognizer(tapRecognizer)
        
        // Hero Three Tap Gesture Recognizer
        heroThreeView.tag = 3
        heroThreeView.userInteractionEnabled = true
        let tapRecognizerHeroThree = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroThreeView.addGestureRecognizer(tapRecognizerHeroThree)
        
        // Add Gradient to all heroes
        let gradientLayerH1 = CAGradientLayer.init()
        let gradientLayerH2 = CAGradientLayer.init()
        let gradientLayerH3 = CAGradientLayer.init()
        
        let colors = [ UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.7).CGColor,
            UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0).CGColor ]
        let startPoint = CGPointMake(0.0, 1.0)
        let endPoint = CGPointMake(0.0, 0.0)
        
        gradientLayerH1.frame = heroOneView.bounds
        gradientLayerH2.frame = heroTwoView.bounds
        gradientLayerH3.frame = heroThreeView.bounds
        
        
        gradientLayerH1.colors = colors
        gradientLayerH2.colors = colors
        gradientLayerH3.colors = colors
        
        gradientLayerH1.startPoint = startPoint
        gradientLayerH1.endPoint = endPoint
        gradientLayerH2.startPoint = startPoint
        gradientLayerH2.endPoint = endPoint
        gradientLayerH3.startPoint = startPoint
        gradientLayerH3.endPoint = endPoint
        
        
        self.heroOneView.layer.addSublayer(gradientLayerH1)
        self.heroTwoView.layer.addSublayer(gradientLayerH2)
        self.heroThreeView.layer.addSublayer(gradientLayerH3)
        
        // Article One
        articleOneType.text = typeArticleOne
        articleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleOneType.textColor = typeColor
        articleOneType.textAlignment = .Center
        
        
        // Article One Tap Gesture Recognizer
        articleOne.tag = 4
        articleOne.userInteractionEnabled = true
        let tapRecognizerArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleOne.addGestureRecognizer(tapRecognizerArticleOne)
        
        // Article Two
        
        articleTwoType.text = typeArticleTwo
        articleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleTwoType.textColor = typeColor
        articleTwoType.textAlignment = .Center
        
        // Article Two Tap Gesture Recognizer
        articleTwo.tag = 5
        articleTwo.userInteractionEnabled = true
        let tapRecognizerArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleTwo.addGestureRecognizer(tapRecognizerArticleTwo)
        
        // Article Three
        
        articleThreeType.text = typeArticleThree
        articleThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleThreeType.textColor = typeColor
        articleThreeType.textAlignment = .Center
        
        
        // Article Three Tap Gesture Recognizer
        articleThree.tag = 6
        articleThree.userInteractionEnabled = true
        let tapRecognizerArticleThree = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleThree.addGestureRecognizer(tapRecognizerArticleThree)
        
        // Article Four
        
        articleFourType.text = typeArticleFour
        articleFourType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleFourType.textColor = typeColor
        articleFourType.textAlignment = .Center
        
        
        // Article Four Tap Gesture Recognizer
        articleFour.tag = 7
        articleFour.userInteractionEnabled = true
        let tapRecognizerArticleFour = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleFour.addGestureRecognizer(tapRecognizerArticleFour)
        
        
        // ------- Watch --------
        
        watchLabel.text = "Watch"
        watchLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        watchLabel.textColor = UIColor.blackColor()
        
        
        // Hero
        
        // Hero Gradient  --- Broken, Fix Later
       
        /*
        let gradientLayerWatchHero = CAGradientLayer.init()
        gradientLayerWatchHero.frame = watchHero.bounds
        gradientLayerWatchHero.colors = colors
        gradientLayerWatchHero.startPoint = startPoint
        gradientLayerWatchHero.endPoint = endPoint
        self.watchHero.layer.addSublayer(gradientLayerWatchHero)
        */
        
        
        // Watch Hero Tap Gesture Recognizer
        watchHero.tag = 10
        watchHero.userInteractionEnabled = true
        let tapRecognizerWatchHero = UITapGestureRecognizer(target: self, action: "imageTappedVideo:")
        watchHero.addGestureRecognizer(tapRecognizerWatchHero)
        
        // Article One
        
        
        // Watch Article One Tap Gesture Recognizer
        watchArticleOne.tag = 11
        watchArticleOne.userInteractionEnabled = true
        let tapRecognizerWatchArticleOne = UITapGestureRecognizer(target: self, action: "imageTappedVideo:")
        watchArticleOne.addGestureRecognizer(tapRecognizerWatchArticleOne)
        
        
        // Article Two
        
        // Watch Article Two Tap Gesture Recognizer
        watchArticleTwo.tag = 12
        watchArticleTwo.userInteractionEnabled = true
        let tapRecognizerWatchArticleTwo = UITapGestureRecognizer(target: self, action: "imageTappedVideo:")
        watchArticleTwo.addGestureRecognizer(tapRecognizerWatchArticleTwo)
        
        
        // ------- Read --------
        
        readLabel.text = "Read"
        readLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        readLabel.textColor = UIColor.blackColor()
        
        // Hero
        
        // Hero Gradient  --- Broken, Fix Later
        
        /*
        let gradientLayerWatchHero = CAGradientLayer.init()
        gradientLayerWatchHero.frame = watchHero.bounds
        gradientLayerWatchHero.colors = colors
        gradientLayerWatchHero.startPoint = startPoint
        gradientLayerWatchHero.endPoint = endPoint
        self.watchHero.layer.addSublayer(gradientLayerWatchHero)
        */
        
        
        // Read Hero Tap Gesture Recognizer
        readHero.tag = 20
        readHero.userInteractionEnabled = true
        let tapRecognizerReadHero = UITapGestureRecognizer(target: self, action: "imageTapped:")
        readHero.addGestureRecognizer(tapRecognizerReadHero)
        
        // Article One
        
        // Read Article One Tap Gesture Recognizer
        readArticleOne.tag = 21
        readArticleOne.userInteractionEnabled = true
        let tapRecognizerReadArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        readArticleOne.addGestureRecognizer(tapRecognizerReadArticleOne)
        
        
        // Article Two
        
        // Read Article Two Tap Gesture Recognizer
        readArticleTwo.tag = 22
        readArticleTwo.userInteractionEnabled = true
        let tapRecognizerReadArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        readArticleTwo.addGestureRecognizer(tapRecognizerReadArticleTwo)
        
        // ------- Learn --------
        
        learnLabel.text = "Learn"
        learnLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        learnLabel.textColor = UIColor.blackColor()
        
        // Hero
        
        
        
        // Hero Gradient  --- Broken, Fix Later
        
        /*
        let gradientLayerWatchHero = CAGradientLayer.init()
        gradientLayerWatchHero.frame = watchHero.bounds
        gradientLayerWatchHero.colors = colors
        gradientLayerWatchHero.startPoint = startPoint
        gradientLayerWatchHero.endPoint = endPoint
        self.watchHero.layer.addSublayer(gradientLayerWatchHero)
        */
        
        // Learn Hero Tap Gesture Recognizer
        learnHero.tag = 30
        learnHero.userInteractionEnabled = true
        let tapRecognizerLearnHero = UITapGestureRecognizer(target: self, action: "imageTapped:")
        learnHero.addGestureRecognizer(tapRecognizerLearnHero)
        
        // Article One
        
        // Learn Article One Tap Gesture Recognizer
        learnArticleOne.tag = 31
        learnArticleOne.userInteractionEnabled = true
        let tapRecognizerLearnArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        learnArticleOne.addGestureRecognizer(tapRecognizerLearnArticleOne)
        
        
        // Article Two
        
        // Learn Article Two Tap Gesture Recognizer
        learnArticleTwo.tag = 32
        learnArticleTwo.userInteractionEnabled = true
        let tapRecognizerLearnArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        learnArticleTwo.addGestureRecognizer(tapRecognizerLearnArticleTwo)
        
        
        // ------- Shop --------
        
        shopLabel.text = "Shop"
        shopLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        shopLabel.textColor = UIColor.blackColor()
        
        // Hero
        
        self.shopHero.image = imageShopHero
        
        shopHeroTitle.text = titleShopHero
        shopHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        shopHeroTitle.textColor = UIColor.whiteColor()
        
        shopHeroType.text = typeShopHero
        shopHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
        shopHeroType.textColor = typeColor
        
        // Hero Gradient  --- Broken, Fix Later
        
        /*
        let gradientLayerWatchHero = CAGradientLayer.init()
        gradientLayerWatchHero.frame = watchHero.bounds
        gradientLayerWatchHero.colors = colors
        gradientLayerWatchHero.startPoint = startPoint
        gradientLayerWatchHero.endPoint = endPoint
        self.watchHero.layer.addSublayer(gradientLayerWatchHero)
        */
        
        // Shop Hero Tap Gesture Recognizer
        shopHero.tag = 40
        shopHero.userInteractionEnabled = true
        let tapRecognizerShopHero = UITapGestureRecognizer(target: self, action: "imageTapped:")
        shopHero.addGestureRecognizer(tapRecognizerShopHero)
        
        // Article One
        shopArticleOne.image = imageShopArticleOne
        
        shopArticleOneType.text = typeShopArticleOne
        shopArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        shopArticleOneType.textColor = typeColor
        shopArticleOneType.textAlignment = .Center
        shopArticleOneTitle.textAlignment = .Center
        
        
        shopArticleOneTitle.text = titleShopArticleOne
        shopArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        shopArticleOneTitle.textColor = UIColor.blackColor()
        
        // Shop Article One Tap Gesture Recognizer
        shopArticleOne.tag = 41
        shopArticleOne.userInteractionEnabled = true
        let tapRecognizerShopArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        shopArticleOne.addGestureRecognizer(tapRecognizerShopArticleOne)
        
        
        // Article Two
        shopArticleTwo.image = imageShopArticleTwo
        
        shopArticleTwoType.text = typeShopArticleTwo
        shopArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        shopArticleTwoType.textColor = typeColor
        shopArticleTwoType.textAlignment = .Center
        
        
        shopArticleTwoTitle.text = titleShopArticleTwo
        shopArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        shopArticleTwoTitle.textColor = UIColor.blackColor()
        shopArticleTwoTitle.textAlignment = .Center
        
        // Learn Article Two Tap Gesture Recognizer
        shopArticleTwo.tag = 32
        shopArticleTwo.userInteractionEnabled = true
        let tapRecognizerShopArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        shopArticleTwo.addGestureRecognizer(tapRecognizerShopArticleTwo)
        
        // Footer 
        
        footerBackground.image = UIImage(named: "black.png")
        footerImageOne.image = UIImage(named: "twitter2.png")
        footerImageTwo.image = UIImage(named: "facebook2.png")
        footerImageThree.image = UIImage(named: "youtube2.png")
        footerImageFour.image = UIImage(named: "instagram2.png")

        
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        switch gestureRecognizer.view!.tag {
        case 1:
            articleClicked = "Hero One"
            passedThumbnail = self.contDict["HeroOne"]!
        case 2:
            articleClicked = "Hero Two"
            passedThumbnail = self.contDict["HeroTwo"]
        case 3:
            articleClicked = "Hero Three"
            passedThumbnail = self.contDict["HeroThree"]
        case 4:
            articleClicked = "Article One"
            passedThumbnail = self.contDict["featuredOne"]
        case 5:
            articleClicked = "Article Two"
            passedThumbnail = self.contDict["featuredTwo"]
        case 6:
            articleClicked = "Article Three"
            passedThumbnail = self.contDict["featuredThree"]
        case 7:
            articleClicked = "Article Four"
            passedThumbnail = self.contDict["featuredFour"]
        case 10:
            articleClicked = "Watch Hero"
            passedThumbnail = self.contDict["watchHero"]
        case 11:
            articleClicked = "Watch Article One"
            passedThumbnail = self.contDict["watchArticleOne"]
        case 12:
            articleClicked = "Watch Article Two"
            passedThumbnail = self.contDict["watchArticleTwo"]
        case 20:
            articleClicked = "Read Hero"
            passedThumbnail = self.contDict["readHero"]
        case 21:
            articleClicked = "Read Article One"
            passedThumbnail = self.contDict["readArticleOne"]
        case 22:
            articleClicked = "Read Article Two"
            passedThumbnail = self.contDict["readArticleTwo"]
        case 30:
            articleClicked = "Learn Hero"
            passedThumbnail = self.contDict["learnHero"]
        case 31:
            articleClicked = "Learn Article One"
            passedThumbnail = self.contDict["learnArticleOne"]
        case 32:
            articleClicked = "Learn Article Two"
            passedThumbnail = self.contDict["learnArticleTwo"]
        case 40:
            articleClicked = "Shop Hero"
            passedThumbnail = self.contDict["shopHero"]
        case 41:
            articleClicked = "Shop Article One"
            passedThumbnail = self.contDict["shopArticleOne"]
        case 42:
            articleClicked = "Shop Article Two"
            passedThumbnail = self.contDict["shopArticleTwo"]
        default:
            articleClicked = "null"
        }
        
        self.performSegueWithIdentifier("goToArticle", sender: self)

    }
    
    func imageTappedVideo(gestureRecognizer: UITapGestureRecognizer) {
        
        switch gestureRecognizer.view!.tag {
        case 1:
            articleClicked = "Hero One"
            passedThumbnail = self.contDict["HeroOne"]!
        case 2:
            articleClicked = "Hero Two"
            passedThumbnail = self.contDict["HeroTwo"]
        case 3:
            articleClicked = "Hero Three"
            passedThumbnail = self.contDict["HeroThree"]
        case 4:
            articleClicked = "Article One"
            passedThumbnail = self.contDict["featuredOne"]
        case 5:
            articleClicked = "Article Two"
            passedThumbnail = self.contDict["featuredTwo"]
        case 6:
            articleClicked = "Article Three"
            passedThumbnail = self.contDict["featuredThree"]
        case 7:
            articleClicked = "Article Four"
            passedThumbnail = self.contDict["featuredFour"]
        case 10:
            articleClicked = "Watch Hero"
            passedThumbnail = self.contDict["watchHero"]
        case 11:
            articleClicked = "Watch Article One"
            passedThumbnail = self.contDict["watchArticleOne"]
        case 12:
            articleClicked = "Watch Article Two"
            passedThumbnail = self.contDict["watchArticleTwo"]
        case 20:
            articleClicked = "Read Hero"
            passedThumbnail = self.contDict["readHero"]
        case 21:
            articleClicked = "Read Article One"
            passedThumbnail = self.contDict["readArticleOne"]
        case 22:
            articleClicked = "Read Article Two"
            passedThumbnail = self.contDict["readArticleTwo"]
        case 30:
            articleClicked = "Learn Hero"
            passedThumbnail = self.contDict["learnHero"]
        case 31:
            articleClicked = "Learn Article One"
            passedThumbnail = self.contDict["learnArticleOne"]
        case 32:
            articleClicked = "Learn Article Two"
            passedThumbnail = self.contDict["learnArticleTwo"]
        case 40:
            articleClicked = "Shop Hero"
            passedThumbnail = self.contDict["shopHero"]
        case 41:
            articleClicked = "Shop Article One"
            passedThumbnail = self.contDict["shopArticleOne"]
        case 42:
            articleClicked = "Shop Article Two"
            passedThumbnail = self.contDict["shopArticleTwo"]
        default:
            articleClicked = "null"
        }
        
        self.performSegueWithIdentifier("goToVideo", sender: self)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToArticle" {
            let DestViewController : articleViewController = segue.destinationViewController as! articleViewController
            DestViewController.article = articleClicked
            DestViewController.articleThumbnail = passedThumbnail
        }
        else if segue.id == "goToVideo" {
            let DestViewVideoController : videoViewController = segue.destinationViewController as! videoViewController
            DestViewVideoController.articleThumbnail = passedThumbnail
        }
        

        
    }
    
    }


