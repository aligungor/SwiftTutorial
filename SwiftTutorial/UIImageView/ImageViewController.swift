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

    @IBAction func segSelectCar(_ sender: AnyObject) {
        if (sender as! UISegmentedControl).selectedSegmentIndex == 0 {
            imgCar.image = UIImage(named:"Ferrari")
        } else {
            imgCar.image = UIImage(named:"Lamborghini")
        }
    }
    
    @IBAction func onClickBtnLoadImage(_ sender: AnyObject) {
        let backgroundQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        imgCar.isHidden = true
        indLoading.startAnimating()
        backgroundQueue.async(execute: {
            let url = URL(string: self.imageUrl)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async(execute: { () -> Void in
                self.imgCar.image = UIImage(data: data!)
                self.imgCar.isHidden = false
                self.indLoading.stopAnimating()
            })
        })
    }
}
