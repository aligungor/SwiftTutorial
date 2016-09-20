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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return carArray.count
    }
    
    func generateCarArray() {
        let car1 = Car()
        car1.carName = "Ferrari"
        car1.carImage = "Ferrari"
        carArray.add(car1)
        carArray.add(Car().generateACar("Lamborghini", imageName: "Lamborghini"))
        carArray.add(Car().generateACar("Tesla", imageName: "Tesla"))
        carArray.add(Car().generateACar("Mercedes-Benz", imageName: "Mercedes"))
        carArray.add(Car().generateACar("BMW", imageName: "BMW"))
        carArray.add(Car().generateACar("Porsche", imageName: "Porsche"))
        carArray.add(Car().generateACar("Aston Martin", imageName: "Aston"))
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell
        let carAtIndex = carArray.object(at: (indexPath as NSIndexPath).row) as! Car
        cell.lblCar?.text = carAtIndex.carName
        cell.imgCar?.image = UIImage(named: carAtIndex.carImage!)
        cell.btnCarInfo?.tag = (indexPath as NSIndexPath).row
        return cell
    }
    
    @IBAction func onClickCarCellInfo(_ sender: UIButton) {
        let carInfoClicked = carArray.object(at: sender.tag) as! Car
        let alert = UIAlertController(
            title: carInfoClicked.carName!,
            message: carInfoClicked.carName! + " Info Button Click!",
            preferredStyle: UIAlertControllerStyle.alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carInfoClicked = carArray.object(at: (indexPath as NSIndexPath).row) as! Car
        let alert = UIAlertController(
            title: carInfoClicked.carName!,
            message: carInfoClicked.carName! + " Cell Select",
            preferredStyle: UIAlertControllerStyle.alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
