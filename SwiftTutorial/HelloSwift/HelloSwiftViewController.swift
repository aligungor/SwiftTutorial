//
//  HelloSwiftViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 25/04/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class HelloSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickHelloSwift(sender: AnyObject) {
        var alert = UIAlertController(
            title: "Hello",
            message: "Hello Swift",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
