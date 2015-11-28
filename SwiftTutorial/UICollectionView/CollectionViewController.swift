//
//  CollectionViewController.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 23/05/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var carArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCarArray();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return carArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("carCell", forIndexPath: indexPath) as! CarCollectionViewCell
        let carAtIndex = carArray.objectAtIndex(indexPath.row) as! Car
        cell.lblCar?.text = carAtIndex.carName
        cell.imgCar?.image = UIImage(named: carAtIndex.carImage!)
        return cell
    }
    
    func generateCarArray() {
        let car1 = Car()
        car1.carName = "Ferrari"
        car1.carImage = "Ferrari"
        carArray.addObject(car1)
        carArray.addObject(Car().generateACar("Lamborghini", imageName: "Lamborghini"))
        carArray.addObject(Car().generateACar("Tesla", imageName: "Tesla"))
        carArray.addObject(Car().generateACar("Mercedes-Benz", imageName: "Mercedes"))
        carArray.addObject(Car().generateACar("BMW", imageName: "BMW"))
        carArray.addObject(Car().generateACar("Porsche", imageName: "Porsche"))
        carArray.addObject(Car().generateACar("Aston Martin", imageName: "Aston"))
        self.collectionView!.reloadData()
    }

}
