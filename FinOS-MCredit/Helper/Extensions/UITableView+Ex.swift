//
//  UITableView+Ex.swift
//  BIDV SmartBanking
//
//  Created by MrFunLife on 10/30/19.
//  Copyright © 2019 MrFunLife. All rights reserved.
//

import UIKit


extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }
}
