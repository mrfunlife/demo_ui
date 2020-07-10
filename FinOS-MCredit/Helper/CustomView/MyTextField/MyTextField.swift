//
//  MyTextField.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/1/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

class MyTextField: BaseView, UITextFieldDelegate {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var csTopPlaceHolder: NSLayoutConstraint!
    @IBOutlet weak var csLeadingPlaceHolder: NSLayoutConstraint!
    
    @IBOutlet weak var viewBorder: UIView!
    
    var placeHolder = "" {
        didSet {
            lblPlaceHolder.text = " \(placeHolder) "
        }
    }
    
    var isCheckSercurity = false {
        didSet {
            textField.isSecureTextEntry = isCheckSercurity
        }
    }

     override func commonInit() {
         Bundle.main.loadNibNamed("MyTextField", owner: self, options: nil)
         addSubview(contentView)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
         textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
         textField.clearButtonMode = .whileEditing
         textField.delegate = self
         setBorderView()
     }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty ?? true
        UIView.animate(withDuration: 0.2, animations: {
            self.csTopPlaceHolder.constant = isEmpty ? 16 : -8
            self.lblPlaceHolder.backgroundColor =  .white
            self.lblPlaceHolder.font = UIFont.systemFont(ofSize: isEmpty ? 14 : 12)
            self.lblPlaceHolder.textColor = UIColor(hexString: isEmpty ?  "#989898" : ColorAppHigh )
            self.csLeadingPlaceHolder.constant = isEmpty ? 15 : 10
            self.layoutIfNeeded()
        }) { (result) in
            self.lblPlaceHolder.backgroundColor =  isEmpty ? .clear :  .white
        }
    }
    
    func setBorderView(){
        viewBorder.layer.borderColor = UIColor(hexString: ColorAppHigh).cgColor
        viewBorder.layer.borderWidth = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}
