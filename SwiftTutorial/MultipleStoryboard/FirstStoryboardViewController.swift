//
//  FirstStoryboardViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 30/05/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class FirstStoryboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickShowSecond(sender: UIButton) {
        // create storyboard object using its file name
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        // create view controller you needed with id
        let secondStoryboardViewController = storyboard.instantiateViewControllerWithIdentifier("secondVC")
        // then use it
        self.navigationController?.pushViewController(secondStoryboardViewController, animated: true)
    }

}
