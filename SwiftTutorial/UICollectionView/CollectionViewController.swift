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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return carArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carCell", for: indexPath) as! CarCollectionViewCell
        let carAtIndex = carArray.object(at: (indexPath as NSIndexPath).row) as! Car
        cell.lblCar?.text = carAtIndex.carName
        cell.imgCar?.image = UIImage(named: carAtIndex.carImage!)
        return cell
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
        self.collectionView!.reloadData()
    }

}
