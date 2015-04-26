//
//  ImageViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 26/04/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imgCar: UIImageView!
    
    @IBOutlet var segCar: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segSelectCar(segCar)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segSelectCar(sender: AnyObject) {
        if (sender as UISegmentedControl).selectedSegmentIndex == 0 {
            imgCar.image = UIImage(named:"Ferrari")
        } else {
            imgCar.image = UIImage(named:"Lamborghini")
        }
    }
}
