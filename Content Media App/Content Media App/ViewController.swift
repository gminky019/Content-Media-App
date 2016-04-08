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
    
    @IBOutlet weak var heroOneView: UIImageView!
    @IBOutlet weak var heroTwoView: UIImageView!
    @IBOutlet weak var heroThreeView: UIImageView!

    @IBOutlet weak var heroOneTitle: UITextView!
    @IBOutlet weak var heroTwoTitle: UITextView!
    @IBOutlet weak var heroThreeTitle: UITextView!
    
    @IBOutlet weak var heroOneType: UITextView!
    @IBOutlet weak var heroTwoType: UITextView!
    @IBOutlet weak var heroThreeType: UITextView!
    
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
    
    @IBOutlet weak var watchHero: UIImageView!
    @IBOutlet weak var watchHeroTitle: UITextView!
    @IBOutlet weak var watchHeroType: UITextView!
    
    @IBOutlet weak var watchArticleOne: UIImageView!
    @IBOutlet weak var watchArticleTwo: UIImageView!
    
    @IBOutlet weak var watchArticleOneType: UITextView!
    @IBOutlet weak var watchArticleTwoType: UITextView!
    
    @IBOutlet weak var watchArticleOneTitle: UITextView!
    @IBOutlet weak var watchArticleTwoTitle: UITextView!
    
    @IBOutlet weak var readHero: UIImageView!
    @IBOutlet weak var readHeroTitle: UITextView!
    @IBOutlet weak var readHeroType: UITextView!
    
    @IBOutlet weak var readArticleOne: UIImageView!
    @IBOutlet weak var readArticleTwo: UIImageView!
    
    @IBOutlet weak var readArticleOneType: UITextView!
    @IBOutlet weak var readArticleTwoType: UITextView!
    
    @IBOutlet weak var readArticleOneTitle: UITextView!
    @IBOutlet weak var readArticleTwoTitle: UITextView!
    
    @IBOutlet weak var learnHero: UIImageView!
    @IBOutlet weak var learnHeroTitle: UITextView!
    @IBOutlet weak var learnHeroType: UITextView!
    
    @IBOutlet weak var learnArticleOne: UIImageView!
    @IBOutlet weak var learnArticleTwo: UIImageView!
    

    @IBOutlet weak var learnArticleOneType: UITextView!
    @IBOutlet weak var learnArticleTwoType: UITextView!
    
    @IBOutlet weak var learnArticleOneTitle: UITextView!
    @IBOutlet weak var learnArticleTwoTitle: UITextView!
    
    @IBOutlet weak var watchLabel: UITextView!
    @IBOutlet weak var readLabel: UITextView!
    @IBOutlet weak var learnLabel: UITextView!
    @IBOutlet weak var shopLabel: UITextView!

    
    @IBOutlet weak var shopHero: UIImageView!
    @IBOutlet weak var shopHeroTitle: UITextView!
    @IBOutlet weak var shopHeroType: UITextView!
    
    @IBOutlet weak var shopArticleOne: UIImageView!
    @IBOutlet weak var shopArticleTwo: UIImageView!
    
    @IBOutlet weak var shopArticleOneType: UITextView!
    @IBOutlet weak var shopArticleTwoType: UITextView!
    
    @IBOutlet weak var shopArticleOneTitle: UITextView!
    @IBOutlet weak var shopArticleTwoTitle: UITextView!
    
    @IBOutlet weak var footerImageOne: UIImageView!
    @IBOutlet weak var footerImageTwo: UIImageView!
    @IBOutlet weak var footerImageThree: UIImageView!
    @IBOutlet weak var footerImageFour: UIImageView!
    @IBOutlet weak var footerBackground: UIImageView!
    
    var articleClicked = "null"
    
    // Hero Articles
    var imageHeroOne = UIImage (named: "tempHeroOne.jpg")
    var titleHeroOne = "Ice Melting In Arctic: How can you save the polar bears?"
    var typeHeroOne = "READ"
    
    var imageHeroTwo = UIImage (named: "tempHeroTwo.jpg")
    var titleHeroTwo = "Monkeys of the Jungle"
    var typeHeroTwo = "WATCH"
    
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
        
        
        let typeColor = UIColor.init(red: 221/255, green: 180/255, blue: 0/255, alpha: 1)
        // ---- Featured Articles ----
        
        // Hero One
        //heroOneView.image = UIImage (named: "tempHeroOne.jpg")
        heroOneView.image = imageHeroOne
        
        heroOneTitle.text = titleHeroOne
        heroOneTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroOneTitle.textColor = UIColor.whiteColor()
        
        heroOneType.text = typeHeroOne
        heroOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroOneType.textColor = typeColor
        
        // Hero One Tap Gesture Recognizer
        heroOneView.tag = 1
        heroOneView.userInteractionEnabled = true
        let tapRecognizerHeroOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroOneView.addGestureRecognizer(tapRecognizerHeroOne)
        
        // Hero Two
        heroTwoView.image = imageHeroTwo
        heroTwoTitle.text = titleHeroTwo
        heroTwoTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroTwoTitle.textColor = UIColor.whiteColor()
        
        heroTwoType.text = typeHeroTwo
        heroTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroTwoType.textColor = typeColor
        
        // Hero Two Tap Gesture Recognizer 
        heroTwoView.tag = 2
        heroTwoView.userInteractionEnabled = true
        let tapRecognizerHeroTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroTwoView.addGestureRecognizer(tapRecognizerHeroTwo)
        
        // Hero Three
        heroThreeView.image = imageHeroThree
        heroThreeTitle.text = titleHeroThree
        heroThreeTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroThreeTitle.textColor = UIColor.whiteColor()

        
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
        articleOne.image = imageArticleOne
        
        articleOneType.text = typeArticleOne
        articleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleOneType.textColor = typeColor
        articleOneType.textAlignment = .Center
        
        articleOneTitle.text = titleArticleOne
        articleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleOneTitle.textColor = UIColor.blackColor()
        
        // Article One Tap Gesture Recognizer
        articleOne.tag = 4
        articleOne.userInteractionEnabled = true
        let tapRecognizerArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleOne.addGestureRecognizer(tapRecognizerArticleOne)
        
        // Article Two
        articleTwo.image = imageArticleTwo
        
        articleTwoType.text = typeArticleTwo
        articleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleTwoType.textColor = typeColor
        articleTwoType.textAlignment = .Center
        
        
        articleTwoTitle.text = titleArticleTwo
        articleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleTwoTitle.textColor = UIColor.blackColor()
        
        // Article Two Tap Gesture Recognizer
        articleTwo.tag = 5
        articleTwo.userInteractionEnabled = true
        let tapRecognizerArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleTwo.addGestureRecognizer(tapRecognizerArticleTwo)
        
        // Article Three
        articleThree.image = imageArticleThree
        
        articleThreeType.text = typeArticleThree
        articleThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleThreeType.textColor = typeColor
        articleThreeType.textAlignment = .Center
        
        
        articleThreeTitle.text = titleArticleThree
        articleThreeTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleThreeTitle.textColor = UIColor.blackColor()
        
        // Article Three Tap Gesture Recognizer
        articleThree.tag = 6
        articleThree.userInteractionEnabled = true
        let tapRecognizerArticleThree = UITapGestureRecognizer(target: self, action: "imageTapped:")
        articleThree.addGestureRecognizer(tapRecognizerArticleThree)
        
        // Article Four
        articleFour.image = imageArticleFour
        
        articleFourType.text = typeArticleFour
        articleFourType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleFourType.textColor = typeColor
        articleFourType.textAlignment = .Center
        
        
        articleFourTitle.text = titleArticleFour
        articleFourTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleFourTitle.textColor = UIColor.blackColor()
        
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
        
        self.watchHero.image = imageWatchHero
        
        watchHeroTitle.text = titleWatchHero
        watchHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        watchHeroTitle.textColor = UIColor.whiteColor()
        
        watchHeroType.text = typeWatchHero
        watchHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
        watchHeroType.textColor = typeColor
        
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
        let tapRecognizerWatchHero = UITapGestureRecognizer(target: self, action: "imageTapped:")
        watchHero.addGestureRecognizer(tapRecognizerWatchHero)
        
        // Article One
        watchArticleOne.image = imageWatchArticleOne
        
        watchArticleOneType.text = typeWatchArticleOne
        watchArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        watchArticleOneType.textColor = typeColor
        watchArticleOneType.textAlignment = .Center
        
        
        watchArticleOneTitle.text = titleWatchArticleOne
        watchArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        watchArticleOneTitle.textColor = UIColor.blackColor()
        
        // Watch Article One Tap Gesture Recognizer
        watchArticleOne.tag = 11
        watchArticleOne.userInteractionEnabled = true
        let tapRecognizerWatchArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        watchArticleOne.addGestureRecognizer(tapRecognizerWatchArticleOne)
        
        
        // Article Two
        watchArticleTwo.image = imageWatchArticleTwo
        
        watchArticleTwoType.text = typeWatchArticleTwo
        watchArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        watchArticleTwoType.textColor = typeColor
        watchArticleTwoType.textAlignment = .Center
        
        
        watchArticleTwoTitle.text = titleWatchArticleTwo
        watchArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        watchArticleTwoTitle.textColor = UIColor.blackColor()
        
        // Watch Article Two Tap Gesture Recognizer
        watchArticleTwo.tag = 12
        watchArticleTwo.userInteractionEnabled = true
        let tapRecognizerWatchArticleTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        watchArticleTwo.addGestureRecognizer(tapRecognizerWatchArticleTwo)
        
        
        // ------- Read --------
        
        readLabel.text = "Read"
        readLabel.font = UIFont(name: "Roboto-Bold", size: 24)
        readLabel.textColor = UIColor.blackColor()
        
        // Hero
        
        self.readHero.image = imageReadHero
        
        readHeroTitle.text = titleReadHero
        readHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        readHeroTitle.textColor = UIColor.whiteColor()
        
        readHeroType.text = typeReadHero
        readHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
        readHeroType.textColor = typeColor
        
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
        readArticleOne.image = imageReadArticleOne
        
        readArticleOneType.text = typeReadArticleOne
        readArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        readArticleOneType.textColor = typeColor
        readArticleOneType.textAlignment = .Center
        
        
        readArticleOneTitle.text = titleReadArticleOne
        readArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        readArticleOneTitle.textColor = UIColor.blackColor()
        
        // Read Article One Tap Gesture Recognizer
        readArticleOne.tag = 21
        readArticleOne.userInteractionEnabled = true
        let tapRecognizerReadArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        readArticleOne.addGestureRecognizer(tapRecognizerReadArticleOne)
        
        
        // Article Two
        readArticleTwo.image = imageReadArticleTwo
        
        readArticleTwoType.text = typeReadArticleTwo
        readArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        readArticleTwoType.textColor = typeColor
        readArticleTwoType.textAlignment = .Center
        
        
        readArticleTwoTitle.text = titleReadArticleTwo
        readArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        readArticleTwoTitle.textColor = UIColor.blackColor()
        
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
        
        self.learnHero.image = imageLearnHero
        
        learnHeroTitle.text = titleLearnHero
        learnHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        learnHeroTitle.textColor = UIColor.whiteColor()
        
        learnHeroType.text = typeLearnHero
        learnHeroType.font = UIFont(name: "Roboto-Medium", size: 12)
        learnHeroType.textColor = typeColor
        
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
        learnArticleOne.image = imageLearnArticleOne
        
        learnArticleOneType.text = typeLearnArticleOne
        learnArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        learnArticleOneType.textColor = typeColor
        learnArticleOneType.textAlignment = .Center
        
        
        learnArticleOneTitle.text = titleLearnArticleOne
        learnArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        learnArticleOneTitle.textColor = UIColor.blackColor()
        
        // Learn Article One Tap Gesture Recognizer
        learnArticleOne.tag = 31
        learnArticleOne.userInteractionEnabled = true
        let tapRecognizerLearnArticleOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        learnArticleOne.addGestureRecognizer(tapRecognizerLearnArticleOne)
        
        
        // Article Two
        learnArticleTwo.image = imageLearnArticleTwo
        
        learnArticleTwoType.text = typeLearnArticleTwo
        learnArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        learnArticleTwoType.textColor = typeColor
        learnArticleTwoType.textAlignment = .Center
        
        
        learnArticleTwoTitle.text = titleLearnArticleTwo
        learnArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        learnArticleTwoTitle.textColor = UIColor.blackColor()
        
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
        case 2:
            articleClicked = "Hero Two"
        case 3:
            articleClicked = "Hero Three"
        case 4:
            articleClicked = "Article One"
        case 5:
            articleClicked = "Article Two"
        case 6:
            articleClicked = "Article Three"
        case 7:
            articleClicked = "Article Four"
        case 10:
            articleClicked = "Watch Hero"
        case 11:
            articleClicked = "Watch Article One"
        case 12:
            articleClicked = "Watch Article Two"
        case 20:
            articleClicked = "Read Hero"
        case 21:
            articleClicked = "Read Article One"
        case 22:
            articleClicked = "Read Article Two"
        case 30:
            articleClicked = "Learn Hero"
        case 31:
            articleClicked = "Learn Article One"
        case 32:
            articleClicked = "Learn Article Two"
        case 40:
            articleClicked = "Shop Hero"
        case 41:
            articleClicked = "Shop Article One"
        case 42:
            articleClicked = "Shop Article Two"
        default:
            articleClicked = "null"
        }
        
        self.performSegueWithIdentifier("goToArticle", sender: self)

    }
    
    
    override func viewDidAppear(animated: Bool) {
        // Nav helper variable
        let nav = self.navigationController?.navigationBar
        // Nav background color

        // Nav button color
        nav?.tintColor = UIColor.blackColor()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        
        
        // Nav Bar Logo
        let image = UIImage(named: "LogoSmall.png" )
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        // Nav Bar Left Button
        var imageNavBar = UIImage(named: "navButton.png" )
        
        imageNavBar = imageNavBar?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageNavBar, style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        // Nav Bar Right Button
        var imageSearch = UIImage(named: "SearchButton.png" )
        
        imageSearch = imageSearch?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageSearch, style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : articleViewController = segue.destinationViewController as! articleViewController
        
        DestViewController.article = articleClicked

        
    }

    }


