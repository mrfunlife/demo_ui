//
//  RadioCell.swift
//  MobileForSale
//
//  Created by Pham Hoang Ha on 12/25/19.
//  Copyright © 2019 Mcredit. All rights reserved.
//

import UIKit

class RadioCell: UICollectionViewCell {
    static let nibName = "RadioCell"
    @IBOutlet weak var icCheckBox: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    
    func fillData(radio: Radio) {
        icCheckBox.image = radio.selected  ? UIImage(named: "radiobox_check") : UIImage(named: "radiobox_uncheck")
        lblName.text = radio.name
    }

}
