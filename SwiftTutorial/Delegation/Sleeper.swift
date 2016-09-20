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
        let backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
        self.delegate?.sleepStarted()
        dispatch_async(backgroundQueue, {
            self.delegate?.sleeping(self, forTime: sleepTime)
            NSThread.sleepForTimeInterval(sleepTime)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.sleepEnd()
            })
        })
    }
}

protocol SleeperDelegate {
    func sleepStarted()
    func sleeping(sleeper: Sleeper, forTime time: Double)
    func sleepEnd()
}
