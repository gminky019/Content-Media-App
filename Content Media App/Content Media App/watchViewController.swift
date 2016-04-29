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
    
    override func viewDidLoad(){
        
        if self.revealViewController() != nil {
            navButton.target = self.revealViewController()
            navButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
}