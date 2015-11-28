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
            print("parsing...")
            let jsonUrl = "http://api.openweathermap.org/data/2.5/weather?q=Nazilli";
            let url = NSURL(string: jsonUrl)
            let jsonData = NSData(contentsOfURL: url!)
            let json: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments)
            // print(json?.debugDescription) // all json data
            
            // get json from json
            let jsonCoords: NSDictionary = json?["coord"] as! NSDictionary
            
            // get parameter from json
            print(jsonCoords["lon"]!)
            let lat = jsonCoords["lat"] as! Float
            print(lat)
            
            // get json array from json
            let weatherArray: NSArray? = json?["weather"] as? NSArray
            print(weatherArray?.objectAtIndex(0)["description"] as! String)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("parsing ends")
            })
        })
    }
    
}
