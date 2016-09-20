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
            "Delegation",
            "Closures",
            "MultipleStoryboards"
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.label.text = (menuItems.object(at: (indexPath as NSIndexPath).row) as AnyObject).description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = menuItems.object(at: (indexPath as NSIndexPath).row) as! String;
        if selected == "Hello Swift" {
            self.performSegue(withIdentifier: "helloSwiftSegue", sender: self)
        } else if selected == "UILabel & UITextField" {
            self.performSegue(withIdentifier: "textSegue", sender: self)
        } else if selected == "UIImageView" {
            self.performSegue(withIdentifier: "imageSegue", sender: self);
        } else if selected == "UITableView & UITableViewController" {
            self.performSegue(withIdentifier: "tableViewSegue", sender: self)
        } else if selected == "UICollectionView & UICollectionViewController" {
            self.performSegue(withIdentifier: "collectionViewSegue", sender: self)
        } else if selected == "UIWebView" {
            self.performSegue(withIdentifier: "webSegue", sender: self)
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
        } else if selected == "Closures" {
            Closures.runClosures()
        } else if selected == "MultipleStoryboards" {
            MultipleStoryboards.showMultipleStoryboards(self.navigationController!);
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
}

