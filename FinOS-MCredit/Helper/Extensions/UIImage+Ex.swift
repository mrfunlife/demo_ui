//
//  UIImage+Ex.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/3/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit


extension UIImage {
    static func getImage(named: String) -> UIImage {
        return UIImage(named: named) ?? UIImage()
    }
}
