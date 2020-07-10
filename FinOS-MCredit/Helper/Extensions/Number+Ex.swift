//
//  Number+Ex.swift
//  MobileForSale
//
//  Created by Pham Hoang Ha on 12/31/19.
//  Copyright © 2019 Mcredit. All rights reserved.
//

import Foundation

extension Int {
    func formatnumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = ","
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
}
