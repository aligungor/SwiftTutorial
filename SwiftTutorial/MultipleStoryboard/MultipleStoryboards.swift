//
//  MultipleStoryboards.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 30/05/16.
//  Copyright © 2016 AliGungor. All rights reserved.
//

import UIKit

class MultipleStoryboards: NSObject {

    class func showMultipleStoryboards(navigationController: UINavigationController) {
        let storyboard = UIStoryboard(name: "First", bundle: nil)
        let firstStoryboardViewController = storyboard.instantiateViewControllerWithIdentifier("firstVC")
        navigationController.pushViewController(firstStoryboardViewController, animated: true)
    }
    
}
