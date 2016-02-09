//
//  Closures.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 09/02/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class Closures: NSObject {
    
    class func runClosures() {
        let closures = Closures()
        
        closures.work({
            print("work done")
        })
        
        print("\n\n\n")
        
        closures.workAndSpeak("it's not rocket science", completionBlock: {
            print("rocket launched")
        })
        
        print("\n\n\n")
        
        closures.speakAfterWork("let's call it", completionBlock: {(said: String) -> Void in
            print(said)
        })
    }
    
    func work(completionBlock:() -> ()) {
        print("start")
        print("end")
        completionBlock()
        print("completionblock called")
    }
    
    func workAndSpeak(words: String, completionBlock:() -> ()) {
        print("start")
        print("i think,", words)
        print("end")
        completionBlock()
        print("completionblock called")
    }
    
    func speakAfterWork(var words: String, completionBlock:(said: String) -> ()) {
        print("start")
        words = words.stringByAppendingString(" a day")
        print("end")
        completionBlock(said: words)
        print("completionblock called")
    }
    
}
