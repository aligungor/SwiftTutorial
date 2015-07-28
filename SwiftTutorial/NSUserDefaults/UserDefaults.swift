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
        var cachedString = defaults.objectForKey(STRING_KEY) as! String
        var cachedInt = defaults.integerForKey(INTEGER_KEY)
        var cachedBool = defaults.boolForKey(BOOL_KEY)
        var cachedFloat = defaults.floatForKey(FLOAT_KEY)
        var cachedDouble = defaults.doubleForKey(DOUBLE_KEY)
        var cachedUrl = defaults.URLForKey(URL_KEY)
        println("cached defaults :")
        println(cachedString)
        println(cachedInt)
        println(cachedBool)
        println(cachedFloat)
        println(cachedDouble)
        println(cachedUrl)
    }
    
    class func work() {
        var userDefaults : UserDefaults = UserDefaults();
        userDefaults.cacheDefaults()
        userDefaults.getCachedDefaults()
    }
    
}
