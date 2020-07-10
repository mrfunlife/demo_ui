//
//  MyButton.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/2/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

class MyButton: BaseView {
    
    @IBOutlet weak var button: ButtonGradient!
    @IBOutlet weak var contentView: UIView!
    
    var onClick: (() -> ())?
    
    var title = "" {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }
    
    override func commonInit() {
        Bundle.main.loadNibNamed("MyButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    @IBAction func onClickButton(_ sender: Any) {
        self.onClick?()
    }
    
}
