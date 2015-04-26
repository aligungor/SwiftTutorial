//
//  TextViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 25/04/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet var txtInput: UITextField!
    @IBOutlet var lblOutput: UILabel!
    @IBOutlet var btnClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickAdd(sender: AnyObject) {
        lblOutput.text = lblOutput.text! + "" + txtInput.text
        txtInput.text = ""
    }
    
    @IBAction func onClickClear(sender: AnyObject) {
        lblOutput.text = ""
        txtInput.text = ""
    }
}
