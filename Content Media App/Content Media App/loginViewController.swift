//
//  loginViewController.swift
//  Content Media App
//
//  Created by Jordan Harris on 4/29/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class loginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        // Facebook Login Button 
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            
            performSegueWithIdentifier("goToHome", sender: nil)
            
        }
        else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()

            loginView.center = self.view.center
            
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
                        self.view.addSubview(loginView)
        }
        
    }
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
}