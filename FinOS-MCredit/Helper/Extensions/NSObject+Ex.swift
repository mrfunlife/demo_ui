//
//  NSObject+Ex.swift
//  BIDV SmartBanking
//
//  Created by MrFunLife on 10/29/19.
//  Copyright © 2019 MrFunLife. All rights reserved.
//

import Foundation

extension NSObject {
    static var nameOfClass: String {
        return String(describing: self)
    }
}
