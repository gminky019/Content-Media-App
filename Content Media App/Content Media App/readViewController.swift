//
//  categoryViewController.swift
//  Content Media App
//
//  Created by Jordan Harris on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class readViewController: UIViewController {
    

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
    
    @IBOutlet weak var footerImageOne: UIImageView!
    @IBOutlet weak var footerImageTwo: UIImageView!
    @IBOutlet weak var footerImageThree: UIImageView!
    @IBOutlet weak var footerImageFour: UIImageView!
    @IBOutlet weak var footerBackground: UIImageView!

    
    override func viewDidLoad(){
        
        
    heroOneView.image = UIImage(named: "tempArtOne.jpg")
        
    heroTwoView.image = UIImage(named: "tempArtTwo.jpg")
        
    originalOne.image = UIImage(named: "DarthMal.png")
        
    originalTwo.image = UIImage(named: "X-Wing Attack.png")
        
    originalThree.image = UIImage(named: "MileniumFalcon.png")
    originalFour.image = UIImage(named: "Vader.png")
        
    originalFive.image = UIImage(named:"KyloRen.png")
    
    originalSix.image = UIImage(named: "r2d2.png")
        
    footerBackground.image = UIImage(named: "black.png")
    footerImageOne.image = UIImage(named: "twitter2.png")
    footerImageTwo.image = UIImage(named: "facebook2.png")
    footerImageThree.image = UIImage(named: "youtube2.png")
    footerImageFour.image = UIImage(named: "instagram2.png")
        
    if self.revealViewController() != nil {
        navButton.target = self.revealViewController()
        navButton.action = "revealToggle:"
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    
    }
}