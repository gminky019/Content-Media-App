//
//  MiddleIntegration.swift
//  Content Media App
//
//  Created by Garrett Minky on 4/7/16.
//  Copyright © 2016 Garrett Minky. All rights reserved.
//

import Foundation

class MiddleIntegration{
    
    let aws: ConnectToAWS
    
    init()
    {
        self.aws = ConnectToAWS()
    }
    
    func getMainPage(completion: (main: MainPageContent) -> ()){
        
        
        self.aws.getMain({(main: MainPageContent) in
            
            
        })
        
    }
    
    
    
}