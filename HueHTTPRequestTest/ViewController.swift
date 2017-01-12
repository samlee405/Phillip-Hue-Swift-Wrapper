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
        
            
        // get lights
//        HueWrapper.sharedInstance.getLights() { result in
//            print(result)
//        }
    
        // get groups
//        HueWrapper.sharedInstance.getGroups() { result in
//            print(result)
//        }

        // turn off all lights
//        HueWrapper.sharedInstance.turnOffLights()
        
        // create a group
//        HueWrapper.sharedInstance.createGroup(lights: ["2"], roomName: "Bathroom")
        
        // turn on a specific group of lights
        HueWrapper.sharedInstance.turnOnLights(group: "2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

