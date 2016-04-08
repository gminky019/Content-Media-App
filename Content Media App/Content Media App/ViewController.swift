//
//  ViewController.swift
//  Content Media App
//
//  Created by Garrett Minky on 2/27/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import QuartzCore
import UIKit

/* class ImageViewWithGradient: UIImageView {
    let myGradientLayer: CAGradientLayer
    
    override init(frame:CGRect)
    {
        myGradientLayer = CAGradientLayer()
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder:NSCoder)
    {
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)
        self.setup()

    }
    
    func setup()
    {
        myGradientLayer.startPoint = CGPoint(x: 0, y: 1)
        myGradientLayer.endPoint = CGPoint(x: 0, y: 0)
        let colors:[CGColorRef] = [
            UIColor.clearColor().CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor,
            UIColor.clearColor().CGColor ]
        myGradientLayer.colors = colors
        myGradientLayer.opaque = false
        myGradientLayer.locations = [0.0, 0.3, 0.5, 0.7, 1.0]
    }
    
    override func layoutSubviews()
    {
        myGradientLayer.frame = self.layer.bounds
    }
    
}
*/
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
    
    @IBOutlet weak var watchLabel: UILabel!
    @IBOutlet weak var readLabel: UILabel!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //GARRETT BACKEND TEST AREA
        let aws: ConnectToAWS = ConnectToAWS()
        
        var mainP: MainPageContent?
        /*
        aws.getMain({(main: MainPageContent) in
            
            mainP = main
        })
        */
        
        var integrate: MiddleIntegration = MiddleIntegration()
        
        integrate.getMainPage(){(main: MainPageContent) in
            
            mainP = main
        }
        
        
        let typeColor = UIColor.init(red: 221/255, green: 180/255, blue: 0/255, alpha: 1)
        // ---- Featured Articles ----
        
        // Hero One
        //heroOneView.image = UIImage (named: "tempHeroOne.jpg")
        if let image = UIImage (named: "tempHeroOne.jpg"){
            heroOneView.image = image
        }
        //TEST FOR BACKEND
       // let temp: ThumbNail = main.hero[0] as! ThumbNail
        //heroOneView.image =  temp.pic
        ////////////
        heroOneTitle.text = "Ice Melting In Arctic: How can you save the polar bears?"
        heroOneTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroOneTitle.textColor = UIColor.whiteColor()
        
        heroOneType.text = "READ"
        heroOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroOneType.textColor = typeColor
        
        heroOneView.userInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "imageTapped:")
        //Add the recognizer to your view.
        heroOneView.addGestureRecognizer(tapRecognizer)
        
        // Hero Two
        self.heroTwoView.image = UIImage (named: "tempHeroTwo.jpg")
        heroTwoTitle.text = "Monkeys of the Jungle"
        heroTwoTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroTwoTitle.textColor = UIColor.whiteColor()
        
        heroTwoType.text = "WATCH"
        heroTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroTwoType.textColor = typeColor
        
        heroTwoView.userInteractionEnabled = true
        heroTwoView.addGestureRecognizer(tapRecognizer)
        
        // Hero Three
        self.heroThreeView.image = UIImage (named: "tempHeroThree.jpg")
        heroThreeTitle.text = "Dolphins: Communication with Sonar"
        heroThreeTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        heroThreeTitle.textColor = UIColor.whiteColor()
        
        heroThreeType.text = "LEARN"
        heroThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
        heroThreeType.textColor = typeColor
        
        
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
        self.articleOne.image = UIImage (named: "tempArtOne.jpg")
        
        articleOneType.text = "READ"
        articleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleOneType.textColor = typeColor
        articleOneType.textAlignment = .Center
        
        articleOneTitle.text = "Jungle Book: Out Now, and it's good!"
        articleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleOneTitle.textColor = UIColor.blackColor()
        
        // Article Two
        self.articleTwo.image = UIImage (named: "tempArtTwo.jpg")
        
        articleTwoType.text = "LEARN"
        articleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleTwoType.textColor = typeColor
        articleTwoType.textAlignment = .Center
        
        
        articleTwoTitle.text = "The Incredibly Diverse Ecosystem in Just This River Will Blow Your Mind"
        articleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleTwoTitle.textColor = UIColor.blackColor()
        
        // Article Three
        self.articleThree.image = UIImage (named: "BB8.jpg")
        
        articleThreeType.text = "WATCH"
        articleThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleThreeType.textColor = typeColor
        articleThreeType.textAlignment = .Center
        
        
        articleThreeTitle.text = "BB8 Saves The Day"
        articleThreeTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleThreeTitle.textColor = UIColor.blackColor()
        
        // Article Four
        self.articleFour.image = UIImage (named: "KyloRen.png")
        
        articleFourType.text = "LEARN"
        articleFourType.font = UIFont(name: "Roboto-Medium", size: 12)
        articleFourType.textColor = typeColor
        articleFourType.textAlignment = .Center
        
        
        articleFourTitle.text = "Learn The Dark Side of The Force with Kylo Ren"
        articleFourTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        articleFourTitle.textColor = UIColor.blackColor()
        
        // ------- Watch --------
        
        watchLabel.text = "Watch"
        watchLabel.font = UIFont(name: "Roboto-Bold", size: 26)
        watchLabel.textColor = UIColor.blackColor()
        
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        watchLabel.attributedText = underlineAttributedString
        
        // Hero 
        
        self.watchHero.image = UIImage (named: "MileniumFalcon.png")
        
        watchHeroTitle.text = "Millennium Falcon: Kessel Run in 12 Parsecs"
        watchHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        watchHeroTitle.textColor = UIColor.whiteColor()
        
        watchHeroType.text = "RE/MX"
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
        
        
        // Article One
        watchArticleOne.image = UIImage (named: "DarthMal.png")
        
        watchArticleOneType.text = "WATCH"
        watchArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        watchArticleOneType.textColor = typeColor
        watchArticleOneType.textAlignment = .Center
        
        
        watchArticleOneTitle.text = "Darth Mal: What was his downfall?"
        watchArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        watchArticleOneTitle.textColor = UIColor.blackColor()
        
        
        // Article Two
        watchArticleTwo.image = UIImage(named: "r2d2.png")
        
        watchArticleTwoType.text = "RE/MX"
        watchArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        watchArticleTwoType.textColor = typeColor
        watchArticleTwoType.textAlignment = .Center
        
        
        watchArticleTwoTitle.text = "Why didn't R2D2 give up the map earlier?"
        watchArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        watchArticleTwoTitle.textColor = UIColor.blackColor()
        
        // ------- Read --------
        
        // Hero
        
        self.readHero.image = UIImage (named: "MileniumFalcon.png")
        
        readHeroTitle.text = "Millennium Falcon: Kessel Run in 12 Parsecs"
        readHeroTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        readHeroTitle.textColor = UIColor.whiteColor()
        
        readHeroType.text = "RE/MX"
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
        
        
        // Article One
        readArticleOne.image = UIImage (named: "DarthMal.png")
        
        readArticleOneType.text = "WATCH"
        readArticleOneType.font = UIFont(name: "Roboto-Medium", size: 12)
        readArticleOneType.textColor = typeColor
        readArticleOneType.textAlignment = .Center
        
        
        readArticleOneTitle.text = "Darth Mal: What was his downfall?"
        readArticleOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        readArticleOneTitle.textColor = UIColor.blackColor()
        
        
        // Article Two
        readArticleTwo.image = UIImage(named: "r2d2.png")
        
        readArticleTwoType.text = "RE/MX"
        readArticleTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
        readArticleTwoType.textColor = typeColor
        readArticleTwoType.textAlignment = .Center
        
        
        readArticleTwoTitle.text = "Why didn't R2D2 give up the map earlier?"
        readArticleTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
        readArticleTwoTitle.textColor = UIColor.blackColor()

        
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        
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


}
