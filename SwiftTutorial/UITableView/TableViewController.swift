//
//  TableViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 17/05/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var carArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateCarArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return carArray.count
    }
    
    func generateCarArray() {
        var car1 = Car()
        car1.carName = "Ferrari"
        car1.carImage = "Ferrari"
        carArray.addObject(car1)
        carArray.addObject(Car().generateACar("Lamborghini", imageName: "Lamborghini"))
        carArray.addObject(Car().generateACar("Tesla", imageName: "Tesla"))
        carArray.addObject(Car().generateACar("Mercedes-Benz", imageName: "Mercedes"))
        carArray.addObject(Car().generateACar("BMW", imageName: "BMW"))
        carArray.addObject(Car().generateACar("Porsche", imageName: "Porsche"))
        carArray.addObject(Car().generateACar("Aston Martin", imageName: "Aston"))
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("carCell", forIndexPath: indexPath) as! CarTableViewCell
        var carAtIndex = carArray.objectAtIndex(indexPath.row) as! Car
        cell.lblCar?.text = carAtIndex.carName
        cell.imgCar?.image = UIImage(named: carAtIndex.carImage!)
        cell.btnCarInfo?.tag = indexPath.row
        return cell
    }
    
    @IBAction func onClickCarCellInfo(sender: UIButton) {
        var carInfoClicked = carArray.objectAtIndex(sender.tag) as! Car
        var alert = UIAlertController(
            title: carInfoClicked.carName!,
            message: carInfoClicked.carName! + " Info Button Click!",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var carInfoClicked = carArray.objectAtIndex(indexPath.row) as! Car
        var alert = UIAlertController(
            title: carInfoClicked.carName!,
            message: carInfoClicked.carName! + " Cell Select",
            preferredStyle: UIAlertControllerStyle.Alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
