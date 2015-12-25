//
//  ViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 25/04/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblMenu: UITableView!
    var menuItems = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = [
            "Hello Swift",
            "UILabel & UITextField",
            "UIImageView",
            "UITableView & UITableViewController",
            "UICollectionView & UICollectionViewController",
            "UIWebView",
            "File Download",
            "JSON Parse",
            "NSUserDefaults",
            "XML Parse",
            "Delegation"
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuCell
        cell.label.text = menuItems.objectAtIndex(indexPath.row).description
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selected = menuItems.objectAtIndex(indexPath.row) as! String;
        if selected == "Hello Swift" {
            self.performSegueWithIdentifier("helloSwiftSegue", sender: self)
        } else if selected == "UILabel & UITextField" {
            self.performSegueWithIdentifier("textSegue", sender: self)
        } else if selected == "UIImageView" {
            self.performSegueWithIdentifier("imageSegue", sender: self);
        } else if selected == "UITableView & UITableViewController" {
            self.performSegueWithIdentifier("tableViewSegue", sender: self)
        } else if selected == "UICollectionView & UICollectionViewController" {
            self.performSegueWithIdentifier("collectionViewSegue", sender: self)
        } else if selected == "UIWebView" {
            self.performSegueWithIdentifier("webSegue", sender: self)
        } else if selected == "File Download" {
            FileDownloader().startDownload()
        } else if selected == "JSON Parse" {
            Json.parseJson();
        } else if selected == "NSUserDefaults" {
            UserDefaults.work()
        } else if selected == "XML Parse" {
            XMLParse.parse()
        } else if selected == "Delegation" {
            Delegation.start()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }
}

