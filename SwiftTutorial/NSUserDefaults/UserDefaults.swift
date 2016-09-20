//
//  UserDefaults.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 27/07/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class UserDefaults: NSObject {
    
    let STRING_KEY = "string"
    let INTEGER_KEY = "integer"
    let BOOL_KEY = "bool"
    let URL_KEY = "url"
    let FLOAT_KEY = "float"
    let DOUBLE_KEY = "double"
    
    var mString : String = "AliGungor"
    var mInt : Int = 25
    var mBool : Bool = false
    var mFloat : Float = 3.14
    var mDouble : Double = 22/7
    var mUrl : URL = URL(string: "http://www.google.com")!
    
    func cacheDefaults() {
        let defaults = Foundation.UserDefaults.standard
        defaults.set(mString, forKey: STRING_KEY)
        defaults.set(mInt, forKey: INTEGER_KEY)
        defaults.set(mBool, forKey: BOOL_KEY)
        defaults.set(mFloat, forKey: FLOAT_KEY)
        defaults.set(mDouble, forKey: DOUBLE_KEY)
        defaults.set(mUrl, forKey: URL_KEY)
    }
    
    func getCachedDefaults() {
        let defaults = Foundation.UserDefaults.standard
        let cachedString = defaults.object(forKey: STRING_KEY) as! String
        let cachedInt = defaults.integer(forKey: INTEGER_KEY)
        let cachedBool = defaults.bool(forKey: BOOL_KEY)
        let cachedFloat = defaults.float(forKey: FLOAT_KEY)
        let cachedDouble = defaults.double(forKey: DOUBLE_KEY)
        let cachedUrl = defaults.url(forKey: URL_KEY)
        print("cached defaults :")
        print(cachedString)
        print(cachedInt)
        print(cachedBool)
        print(cachedFloat)
        print(cachedDouble)
        print(cachedUrl)
    }
    
    class func work() {
        let userDefaults : UserDefaults = UserDefaults();
        userDefaults.cacheDefaults()
        userDefaults.getCachedDefaults()
    }
    
}
