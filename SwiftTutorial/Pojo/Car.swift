//
//  Car.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 17/05/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class Car: NSObject {
    var carName : String?
    var carImage : String?
    
    func generateACar(_ name: String, imageName image: String) -> Car {
        self.carName = name
        self.carImage = image
        return self
    }
    
}
