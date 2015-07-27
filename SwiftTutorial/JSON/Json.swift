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
        let backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
        dispatch_async(backgroundQueue, {
            println("parsing...")
            var jsonUrl = "http://api.openweathermap.org/data/2.5/weather?q=Nazilli";
            var url = NSURL(string: jsonUrl)
            var jsonData = NSData(contentsOfURL: url!)
            var json: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            println(json?.debugDescription)
            
            // get json from json
            var jsonCoords: NSDictionary = json?["coord"] as! NSDictionary
            
            // get parameter from json
            println(jsonCoords["lon"]!)
            var lat = jsonCoords["lat"] as! Float
            println(lat)
            
            // get json array from json
            var weatherArray: NSArray? = json?["weather"] as? NSArray
            println(weatherArray?.objectAtIndex(0)["description"] as! String)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                println("parsing ends")
            })
        })
    }
    
}
