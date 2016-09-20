//
//  SecondStoryboardViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 30/05/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class SecondStoryboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickShowFirst(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "First", bundle: nil)
        let firstStoryboardViewController = storyboard.instantiateViewController(withIdentifier: "firstVC")
        self.navigationController?.pushViewController(firstStoryboardViewController, animated: true)
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
