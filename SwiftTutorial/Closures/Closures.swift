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
    
    func work(_ completionBlock:() -> ()) {
        print("start")
        print("end")
        completionBlock()
        print("completionblock called")
    }
    
    func workAndSpeak(_ words: String, completionBlock:() -> ()) {
        print("start")
        print("i think,", words)
        print("end")
        completionBlock()
        print("completionblock called")
    }
    
    func speakAfterWork(_ words: String, completionBlock:(_ said: String) -> ()) {
        print("start")
        print(words + " a day")
        print("end")
        completionBlock(words)
        print("completionblock called")
    }
    
}
