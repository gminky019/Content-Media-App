//
//  ViewController.swift
//  Content Media App
//
//  Created by Garrett Minky on 2/27/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heroOneView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heroOneView.image = UIImage (named: "tempHeroOne.jpg")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Nav helper variable
        var nav = self.navigationController?.navigationBar
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
