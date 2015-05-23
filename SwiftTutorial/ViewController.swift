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
            "UICollectionView & UICollectionViewController"
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
        if menuItems.objectAtIndex(indexPath.row) as! String == "Hello Swift" {
            self.performSegueWithIdentifier("helloSwiftSegue", sender: self)
        } else if menuItems.objectAtIndex(indexPath.row) as! String == "UILabel & UITextField" {
            self.performSegueWithIdentifier("textSegue", sender: self)
        } else if menuItems.objectAtIndex(indexPath.row) as! String == "UIImageView" {
            self.performSegueWithIdentifier("imageSegue", sender: self);
        } else if menuItems.objectAtIndex(indexPath.row) as! String == "UITableView & UITableViewController" {
            self.performSegueWithIdentifier("tableViewSegue", sender: self)
        } else if menuItems.objectAtIndex(indexPath.row) as! String == "UICollectionView & UICollectionViewController" {
            self.performSegueWithIdentifier("collectionViewSegue", sender: self)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44;
    }
}

