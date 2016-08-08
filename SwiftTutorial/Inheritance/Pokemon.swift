//
//  Pokemon.swift
//  SwiftTutorial
//
//  Created by AliGungor on 8/8/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    
    var type: String
    var weight: Float
    var height: Float
    
    init(type: String, weight: Float, height: Float) {
        self.type = type
        self.weight = weight
        self.height = height
    }
    
    func printInfo() {
        print("Type:\(type), Weight:\(weight), Height:\(height)")
    }
    
    func attack() {
        print("I can not hurt anyone")
    }
    
}
