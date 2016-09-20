//
//  Sleeper.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 25/12/15.
//  Copyright © 2015 AliGungor. All rights reserved.
//

import UIKit

class Sleeper: NSObject {
    
    var delegate: SleeperDelegate?

    override init() {
    }
    
    func doYourBussiness() {
        let sleepTime = 3.0
        let backgroundQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        self.delegate?.sleepStarted()
        backgroundQueue.async(execute: {
            self.delegate?.sleeping(self, forTime: sleepTime)
            Thread.sleep(forTimeInterval: sleepTime)
            DispatchQueue.main.async(execute: { () -> Void in
                self.delegate?.sleepEnd()
            })
        })
    }
}

protocol SleeperDelegate {
    func sleepStarted()
    func sleeping(_ sleeper: Sleeper, forTime time: Double)
    func sleepEnd()
}
