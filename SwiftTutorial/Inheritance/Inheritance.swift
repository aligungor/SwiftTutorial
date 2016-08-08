//
//  Inheritance.swift
//  SwiftTutorial
//
//  Created by AliGungor on 8/8/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class Inheritance: NSObject {

    class func work() {
        let pikachu: Pikachu = Pikachu(type: "Electric", weight: 9.48, height: 0.4)
        pikachu.printInfo()
        
        let bulbasaur: Bulbasaur = Bulbasaur(type: "Grass", weight: 8.87, height: 0.56)
        bulbasaur.printInfo()
        
        pikachu.attack()
        bulbasaur.attack()
    }
    
}
