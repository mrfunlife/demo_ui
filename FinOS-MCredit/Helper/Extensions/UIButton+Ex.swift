//
//  UIButton+Ex.swift
//  BIDV SmartBanking
//
//  Created by MrFunLife on 10/28/19.
//  Copyright © 2019 MrFunLife. All rights reserved.
//

import UIKit

extension UIButton {
    func setUnderLine(){
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: self.titleLabel?.font ?? UIFont.systemFont(ofSize: 13),
            .foregroundColor: UIColor.init(hexString: "#212121"),
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: self.titleLabel?.text ?? "",
                                                        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
    }
}
