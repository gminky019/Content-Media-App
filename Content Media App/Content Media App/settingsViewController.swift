//
//  settingsViewController.swift
//  Content Media App
//
//  Created by Jordan Harris on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class settingsViewController: UIViewController {
    
    @IBOutlet weak var navButton: UIBarButtonItem!
    
    override func viewDidLoad(){
        
    if self.revealViewController() != nil {
        navButton.target = self.revealViewController()
        navButton.action = "revealToggle:"
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}