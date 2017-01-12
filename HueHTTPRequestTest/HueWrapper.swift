//
//  HueWrapper.swift
//  HueHTTPRequestTest
//
//  Created by Sam Lee on 1/11/17.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

class HueWrapper {
    
    // base url : http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/
    
    let session = URLSession.shared
    
    func getLights(completionHandler: @escaping ((_ result : JSON) -> [String])) {
        let url = URL(string: "http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/lights/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let requestedData = data {
                let convertedData = JSON(data: requestedData)
                completionHandler(convertedData)
            }
            else {
                print("Error getting lights")
            }
        }
        
        task.resume()
    }
    
    func getGroups(completionHandler: @escaping ((_ result : JSON) -> [String])) {
        let url = URL(string: "http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/groups/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let requestedData = data {
                let convertedData = JSON(data: requestedData)
                completionHandler(convertedData)
            }
            else {
                print("Error getting groups")
            }
        }
        
        task.resume()
    }
    
    func turnOffLights(allLights: [String]) { // change to use "group 0"
        for light in allLights {
            let urlString = "http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/" + light + "/state"
            let url = URL(string: urlString)!
            
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            
            let dataToSend = "on=true"
            
            request.httpBody = dataToSend.data(using: String.Encoding.utf8)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if let returnResponse = response {
                    print(returnResponse)
                }
                else {
                    print("Error turning off light \(light)")
                }
            }
            
            task.resume()
        }
    }
    
    func turnOnLights(group: String) {
        let urlString = "http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/groups/" + group + "/action"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let dataToSend = "on=true"
        
        request.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let returnResponse = response {
                print(returnResponse)
            }
            else {
                print("Error turning on light group")
            }
        }
        
        task.resume()
    }
    
    func createGroup(lights: [String], roomName: String) {
        let url = URL(string: "http://172.30.5.4/api/Woco7fXdtvyLUtOcMq7WuBesSSzYzTSJz1JYXFrT/groups")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let dataToSend: [String:Any] = ["name": roomName,
                                        "type": "LightGroup",
                                        "class": "Living room",
                                        "lights": lights]
        
        let castedDataToSend = try? JSONSerialization.data(withJSONObject: dataToSend, options: JSONSerialization.WritingOptions.prettyPrinted)
        request.httpBody = castedDataToSend
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let returnResponse = response {
                print(returnResponse)
            }
            else {
                print("Error creating group")
            }
        }
        
        task.resume()
    }
}







