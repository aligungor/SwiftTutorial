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
    var mUrl : NSURL = NSURL(string: "http://www.google.com")!
    
    func cacheDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(mString, forKey: STRING_KEY)
        defaults.setInteger(mInt, forKey: INTEGER_KEY)
        defaults.setBool(mBool, forKey: BOOL_KEY)
        defaults.setFloat(mFloat, forKey: FLOAT_KEY)
        defaults.setDouble(mDouble, forKey: DOUBLE_KEY)
        defaults.setURL(mUrl, forKey: URL_KEY)
    }
    
    func getCachedDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let cachedString = defaults.objectForKey(STRING_KEY) as! String
        let cachedInt = defaults.integerForKey(INTEGER_KEY)
        let cachedBool = defaults.boolForKey(BOOL_KEY)
        let cachedFloat = defaults.floatForKey(FLOAT_KEY)
        let cachedDouble = defaults.doubleForKey(DOUBLE_KEY)
        let cachedUrl = defaults.URLForKey(URL_KEY)
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
