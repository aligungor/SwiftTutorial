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
    @IBOutlet var indLoading: UIActivityIndicatorView!
    
    var imageUrl = "http://www.allcarbrandslist.com/wp-content/uploads/2015/03/mustang-logo.gif"

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
        if (sender as! UISegmentedControl).selectedSegmentIndex == 0 {
            imgCar.image = UIImage(named:"Ferrari")
        } else {
            imgCar.image = UIImage(named:"Lamborghini")
        }
    }
    
    @IBAction func onClickBtnLoadImage(sender: AnyObject) {
        let backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
        imgCar.hidden = true
        indLoading.startAnimating()
        dispatch_async(backgroundQueue, {
            let url = NSURL(string: self.imageUrl)
            let data = NSData(contentsOfURL: url!)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.imgCar.image = UIImage(data: data!)
                self.imgCar.hidden = false
                self.indLoading.stopAnimating()
            })
        })
    }
}
