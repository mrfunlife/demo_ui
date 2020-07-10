//
//  CheckBox.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/1/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit


class CheckBox : BaseView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var icCheck: UIImageView!
    @IBOutlet weak var lblTitleCheck: UILabel!
    var listenerCheckBox: ((Bool) -> ())?
    
    var isCheck = false {
        didSet {
            UIView.transition(with: self.icCheck,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                              self.icCheck.image = UIImage(named: self.isCheck ? "ic_check" : "ic_uncheck")
            }){ (result) in
                self.listenerCheckBox?(self.isCheck)
            }
        }
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        isCheck = !isCheck
    }
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CheckBox", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    func initCheckBox(title: String, isCheck: Bool = false) {
        lblTitleCheck.text = title
        self.isCheck = isCheck
    }
    
}

