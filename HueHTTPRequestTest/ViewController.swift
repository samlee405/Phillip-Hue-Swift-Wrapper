//
//  ViewController.swift
//  HueHTTPRequestTest
//
//  Created by Sam Lee on 1/11/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Bridge IP Address : 172.30.5.4
    // Username : Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT

    override func viewDidLoad() {
        super.viewDidLoad()

        let apiWrapper = HueWrapper()
        
        // get lights
        apiWrapper.getLights() { result in
            var dataToReturn = [String]()
            for (key, _) in result {
                dataToReturn.append(key)
            }
            
            return dataToReturn
        }
        
        // get groups
        apiWrapper.getGroups() { result in
            var dataToReturn = [String]()
            for (key, _) in result {
                dataToReturn.append(key)
            }
            
            return dataToReturn
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    
    
    
}

