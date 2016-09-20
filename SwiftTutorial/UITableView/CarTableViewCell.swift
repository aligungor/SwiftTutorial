//
//  CarTableViewCell.swift
//  SwiftTutorial
//
//  Created by Ali Gungor on 17/05/15.
//  Copyright (c) 2015 AliGungor. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet var imgCar : UIImageView?
    @IBOutlet var lblCar : UILabel?
    @IBOutlet var btnCarInfo : UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
