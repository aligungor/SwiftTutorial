//
//  Json.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 26/07/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class Json: NSObject {
    
    class func parseJson() {
        let backgroundQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        backgroundQueue.async(execute: {
            print("parsing...")
            let jsonUrl = "http://api.openweathermap.org/data/2.5/weather?q=Nazilli";
            let url = URL(string: jsonUrl)
            let jsonData = try? Data(contentsOf: url!)
            let json: AnyObject? = try! JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
            // print(json?.debugDescription) // all json data
            
            // get json from json
            let jsonCoords: NSDictionary = json?["coord"] as! NSDictionary
            
            // get parameter from json
            print(jsonCoords["lon"]!)
            let lat = jsonCoords["lat"] as! Float
            print(lat)
            
            // get json array from json
            let weatherArray: NSArray? = json?["weather"] as? NSArray
            let weatherDictionary: NSDictionary? = weatherArray?.object(at: 0) as! NSDictionary?
            print(weatherDictionary?.object(forKey: "description") as! String)
            DispatchQueue.main.async(execute: { () -> Void in
                print("parsing ends")
            })
        })
    }
    
}
