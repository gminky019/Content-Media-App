//
//  watchViewController.swift
//
//
//  Created by Jordan Harris on 4/28/16.
//
//

import Foundation

class watchViewController: UIViewController {
    
    
    @IBOutlet weak var navButton: UIBarButtonItem!
    
    @IBOutlet weak var heroOneView: UIImageView!
    @IBOutlet weak var heroOneIcon: UIImageView!
    @IBOutlet weak var heroOneType: UITextView!
    @IBOutlet weak var heroOneTitle: UITextView!
    
    @IBOutlet weak var heroTwoView: UIImageView!
    @IBOutlet weak var heroTwoIcon: UIImageView!
    @IBOutlet weak var heroTwoType: UITextView!
    @IBOutlet weak var heroTwoTitle: UITextView!
    
    @IBOutlet weak var originalOne: UIImageView!
    @IBOutlet weak var originalOneIcon: UIImageView!
    
    @IBOutlet weak var originalTwo: UIImageView!
    @IBOutlet weak var originalTwoIcon: UIImageView!
    
    @IBOutlet weak var originalThree: UIImageView!
    @IBOutlet weak var originalThreeIcon: UIImageView!
    
    @IBOutlet weak var originalFour: UIImageView!
    @IBOutlet weak var originalFourIcon: UIImageView!
    
    @IBOutlet weak var originalFive: UIImageView!
    @IBOutlet weak var originalFiveIcon: UIImageView!
    
    @IBOutlet weak var originalSix: UIImageView!
    @IBOutlet weak var originalSixIcon: UIImageView!
    
    @IBOutlet weak var recentOne: UIImageView!
    @IBOutlet weak var recentOneIcon: UIImageView!
    @IBOutlet weak var recentOneType: UITextView!
    @IBOutlet weak var recentOneTitle: UITextView!
    
    @IBOutlet weak var recentTwo: UIImageView!
    @IBOutlet weak var recentTwoIcon: UIImageView!
    @IBOutlet weak var recentTwoType: UITextView!
    @IBOutlet weak var recentTwoTitle: UITextView!
    
    @IBOutlet weak var recentThree: UIImageView!
    @IBOutlet weak var recentThreeIcon: UIImageView!
    @IBOutlet weak var recentThreeType: UITextView!
    @IBOutlet weak var recentThreeTitle: UITextView!
    
    @IBOutlet weak var recentFour: UIImageView!
    @IBOutlet weak var recentFourIcon: UIImageView!
    @IBOutlet weak var recentFourType: UITextView!
    @IBOutlet weak var recentFourTitle: UITextView!
    
    @IBOutlet weak var recentFive: UIImageView!
    @IBOutlet weak var recentFiveIcon: UIImageView!
    @IBOutlet weak var recentFiveType: UITextView!
    @IBOutlet weak var recentFiveTitle: UITextView!
    
    @IBOutlet weak var recentSix: UIImageView!
    @IBOutlet weak var recentSixIcon: UIImageView!
    @IBOutlet weak var recentSixType: UITextView!
    @IBOutlet weak var recentSixTitle: UITextView!
    
    @IBOutlet weak var footerBackground: UIImageView!
    @IBOutlet weak var footerImageOne: UIImageView!
    @IBOutlet weak var footerImageTwo: UIImageView!
    @IBOutlet weak var footerImageThree: UIImageView!
    @IBOutlet weak var footerImageFour: UIImageView!
    
    var articleClicked = "null"
    var contDict: [String: ThumbNail] = [String: ThumbNail]()
    var passedThumbnail: ThumbNail!
    
    override func viewDidLoad(){
        
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: 86, height: 44))
        let image = UIImage(named: "Logo.png")
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        var overlay : UIView
        overlay = UIView(frame: view.frame)
        
        let backgroundOverlay = UIImage(named: "BackgroundImageLoading2.png")
        
        let backgroundView = UIImageView(image: backgroundOverlay)
        
        var activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRectMake(0, 0, 40, 40)
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.center = CGPointMake(overlay.bounds.width / 2, (overlay.bounds.height / 3)*2)
        
        backgroundView.addSubview(activityIndicator)
        
        view.addSubview(backgroundView)
        
        activityIndicator.startAnimating()
        
        
        var integrate: MiddleIntegration = MiddleIntegration()
        var content: ContentPage?
        let typeColor = UIColor.init(red: 221/255, green: 180/255, blue: 0/255, alpha: 1)
        
        integrate.getVideoPage(){ (returned: ContentPage) in
            content = returned
            
            
            var her1: ThumbNail = returned._heroes[0]
            var her2: ThumbNail = returned._heroes[1]
            var org1: ThumbNail = returned._others[0]
            var org2: ThumbNail = returned._others[1]
            var org3: ThumbNail = returned._others[2]
            var org4: ThumbNail = returned._others[3]
            var org5: ThumbNail = returned._others[4]
            var org6: ThumbNail = returned._others[5]
            var rec1: ThumbNail = returned._others[6]
            var rec2: ThumbNail = returned._others[7]
            var rec3: ThumbNail = returned._others[8]
            var rec4: ThumbNail = returned._others[9]
            var rec5: ThumbNail = returned._others[10]
            var rec6: ThumbNail = returned._others[11]
            
            self.contDict["HeroOne"] = her1
            self.contDict["HeroTwo"] = her2
            self.contDict["OriginalOne"] = org1
            self.contDict["OriginalTwo"] = org2
            self.contDict["OriginalThree"] = org3
            self.contDict["OriginalFour"] = org4
            self.contDict["OriginalFive"] = org5
            self.contDict["OriginalSix"] = org6
            self.contDict["RecentOne"] = rec1
            self.contDict["RecentTwo"] = rec2
            self.contDict["RecentThree"] = rec3
            self.contDict["RecentFour"] = rec4
            self.contDict["RecentFive"] = rec5
            self.contDict["RecentSix"] = rec6
            
            
            
            self.heroOneView.image = her1.pic
            self.heroOneTitle.text = her1.title
            self.heroOneType.text = "WATCH"
            self.heroOneIcon.image = UIImage (named: "watchicon.png")
            
            self.heroTwoView.image = her2.pic
            self.heroTwoTitle.text = her2.title
            self.heroTwoType.text = "WATCH"
            self.heroTwoIcon.image = UIImage (named: "watchicon.png")
            
            self.originalOne.image = org1.pic
            self.originalOneIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.originalTwo.image = org2.pic
            self.originalTwoIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.originalThree.image = org3.pic
            self.originalThreeIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.originalFour.image = org4.pic
            self.originalFourIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.originalFive.image = org5.pic
            self.originalFiveIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.originalSix.image = org6.pic
            self.originalSixIcon.image = UIImage (named: "watchiconsmall.png")
            
            self.recentOne.image = rec1.pic
            self.recentOneIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentOneTitle.text = rec1.title
            self.recentOneType.text = "WATCH"
            
            self.recentTwo.image = rec2.pic
            self.recentTwoIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentTwoTitle.text = rec2.title
            self.recentTwoType.text = "WATCH"
            
            self.recentThree.image = rec3.pic
            self.recentThreeIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentThreeTitle.text = rec3.title
            self.recentThreeType.text = "WATCH"
            
            self.recentFour.image = rec4.pic
            self.recentFourIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentFourTitle.text = rec4.title
            self.recentFourType.text = "WATCH"
            
            self.recentFive.image = rec5.pic
            self.recentFiveIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentFiveTitle.text = rec5.title
            self.recentFiveType.text = "WATCH"
            
            self.recentSix.image = rec6.pic
            self.recentSixIcon.image = UIImage (named: "watchiconsmall.png")
            self.recentSixTitle.text = rec6.title
            self.recentSixType.text = "WATCH"
            
            self.heroOneTitle.font = UIFont(name: "Roboto-Bold", size: 18)
            self.heroOneTitle.textColor = UIColor.whiteColor()
            self.heroOneType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.heroOneType.textColor = typeColor
            
            self.heroTwoTitle.font = UIFont(name: "Roboto-Bold", size: 18)
            self.heroTwoTitle.textColor = UIColor.whiteColor()
            self.heroTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.heroTwoType.textColor = typeColor
            
            self.recentOneType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentOneType.textColor = typeColor
            self.recentOneType.textAlignment = .Center
            
            self.recentOneTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentOneTitle.textColor = UIColor.blackColor()
            self.recentOneTitle.textAlignment = .Center
            
            self.recentTwoType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentTwoType.textColor = typeColor
            self.recentTwoType.textAlignment = .Center
            
            self.recentTwoTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentTwoTitle.textColor = UIColor.blackColor()
            self.recentTwoTitle.textAlignment = .Center
            
            self.recentThreeType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentThreeType.textColor = typeColor
            self.recentThreeType.textAlignment = .Center
            
            self.recentThreeTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentThreeTitle.textColor = UIColor.blackColor()
            self.recentThreeTitle.textAlignment = .Center
            
            self.recentFourType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentFourType.textColor = typeColor
            self.recentFourType.textAlignment = .Center
            
            self.recentFourTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentFourTitle.textColor = UIColor.blackColor()
            self.recentFourTitle.textAlignment = .Center
            
            self.recentFiveType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentFiveType.textColor = typeColor
            self.recentFiveType.textAlignment = .Center
            
            self.recentFiveTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentFiveTitle.textColor = UIColor.blackColor()
            self.recentFiveTitle.textAlignment = .Center
            
            self.recentSixType.font = UIFont(name: "Roboto-Medium", size: 12)
            self.recentSixType.textColor = typeColor
            self.recentSixType.textAlignment = .Center
            
            self.recentSixTitle.font = UIFont(name: "Roboto-Bold", size: 14)
            self.recentSixTitle.textColor = UIColor.blackColor()
            self.recentSixTitle.textAlignment = .Center
            
            backgroundView.removeFromSuperview()
        }
        
        footerBackground.image = UIImage(named: "black.png")
        footerImageOne.image = UIImage(named: "twitter2.png")
        footerImageTwo.image = UIImage(named: "facebook2.png")
        footerImageThree.image = UIImage(named: "youtube2.png")
        footerImageFour.image = UIImage(named: "instagram2.png")
        
        heroOneView.tag = 1
        heroOneView.userInteractionEnabled = true
        let tapRecognizerHeroOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroOneView.addGestureRecognizer(tapRecognizerHeroOne)
        
        heroTwoView.tag = 2
        heroTwoView.userInteractionEnabled = true
        let tapRecognizerHeroTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        heroTwoView.addGestureRecognizer(tapRecognizerHeroTwo)
        
        originalOne.tag = 3
        originalOne.userInteractionEnabled = true
        let tapRecognizerOrgOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalOne.addGestureRecognizer(tapRecognizerOrgOne)
        
        originalTwo.tag = 4
        originalTwo.userInteractionEnabled = true
        let tapRecognizerOrgTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalTwo.addGestureRecognizer(tapRecognizerOrgTwo)
        
        originalThree.tag = 5
        originalThree.userInteractionEnabled = true
        let tapRecognizerOrgThree = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalThree.addGestureRecognizer(tapRecognizerOrgThree)
        
        originalFour.tag = 6
        originalFour.userInteractionEnabled = true
        let tapRecognizerOrgFour = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalFour.addGestureRecognizer(tapRecognizerOrgFour)
        
        originalFive.tag = 7
        originalFive.userInteractionEnabled = true
        let tapRecognizerOrgFive = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalFive.addGestureRecognizer(tapRecognizerOrgFive)
        
        originalSix.tag = 8
        originalSix.userInteractionEnabled = true
        let tapRecognizerOrgSix = UITapGestureRecognizer(target: self, action: "imageTapped:")
        originalSix.addGestureRecognizer(tapRecognizerOrgSix)
        
        recentOne.tag = 9
        recentOne.userInteractionEnabled = true
        let tapRecognizerRecOne = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentOne.addGestureRecognizer(tapRecognizerRecOne)
        
        recentTwo.tag = 10
        recentTwo.userInteractionEnabled = true
        let tapRecognizerRecTwo = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentTwo.addGestureRecognizer(tapRecognizerRecTwo)
        
        recentThree.tag = 11
        recentThree.userInteractionEnabled = true
        let tapRecognizerRecThree = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentThree.addGestureRecognizer(tapRecognizerRecThree)
        
        recentFour.tag = 12
        recentFour.userInteractionEnabled = true
        let tapRecognizerRecFour = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentFour.addGestureRecognizer(tapRecognizerRecFour)
        
        recentFive.tag = 13
        recentFive.userInteractionEnabled = true
        let tapRecognizerRecFive = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentFive.addGestureRecognizer(tapRecognizerRecFive)
        
        recentSix.tag = 14
        recentSix.userInteractionEnabled = true
        let tapRecognizerRecSix = UITapGestureRecognizer(target: self, action: "imageTapped:")
        recentSix.addGestureRecognizer(tapRecognizerRecSix)
        
        if self.revealViewController() != nil {
            navButton.target = self.revealViewController()
            navButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
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
            articleClicked = "Original One"
            passedThumbnail = self.contDict["OriginalOne"]
        case 4:
            articleClicked = "Original Two"
            passedThumbnail = self.contDict["OriginalTwo"]
        case 5:
            articleClicked = "Original Three"
            passedThumbnail = self.contDict["OriginalThree"]
        case 6:
            articleClicked = "Original Four"
            passedThumbnail = self.contDict["OriginalFour"]
        case 7:
            articleClicked = "Original Five"
            passedThumbnail = self.contDict["OriginalFive"]
        case 8:
            articleClicked = "Original Six"
            passedThumbnail = self.contDict["OriginalSix"]
        case 9:
            articleClicked = "Recent One"
            passedThumbnail = self.contDict["RecentOne"]
        case 10:
            articleClicked = "Recent Two"
            passedThumbnail = self.contDict["RecentTwo"]
        case 11:
            articleClicked = "Recent Three"
            passedThumbnail = self.contDict["RecentThree"]
        case 12:
            articleClicked = "Recent Four"
            passedThumbnail = self.contDict["RecentFour"]
        case 13:
            articleClicked = "Recent Five"
            passedThumbnail = self.contDict["RecentFive"]
        case 14:
            articleClicked = "Recent Six"
            passedThumbnail = self.contDict["RecentSix"]
        default:
            articleClicked = "null"
        }
        
        self.performSegueWithIdentifier("goToVideo", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : videoViewController = segue.destinationViewController as! videoViewController
        
        DestViewController.articleThumbnail = passedThumbnail
        
        
    }
}