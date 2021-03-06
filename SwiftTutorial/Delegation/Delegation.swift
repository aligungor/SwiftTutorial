//
//  Delegation.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 25/12/15.
//  Copyright © 2015 AliGungor. All rights reserved.
//

import UIKit

class Delegation: SleeperDelegate {
    
    class func start() {
        let delegation = Delegation()
        let sleeper = Sleeper()
        sleeper.delegate = delegation
        sleeper.doYourBussiness()
    }
    
    func sleepStarted() {
        print("sleeper started sleeping")
    }
    
    func sleeping(_ sleeper: Sleeper, forTime time: Double) {
        print("sleeper is sleeping for \(time) seconds")
    }
    
    func sleepEnd() {
        print("sleeper woke up")
    }
    
}
