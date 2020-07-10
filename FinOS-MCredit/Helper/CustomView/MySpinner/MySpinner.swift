//
//  MySpinner.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/2/20.
//  Copyright © 2020 Mcredit. All rights reserved.
///Users/phamhoangha/Desktop/LocDG

import UIKit

class MySpinner: BaseView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var csLeadingPlaceHolder: NSLayoutConstraint!
    @IBOutlet weak var csTopPlaceHolder: NSLayoutConstraint!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    @IBOutlet weak var lblTitleSelect: UILabel!
    
    @IBOutlet weak var viewBorder: UIView!
    
    lazy var rootVC = BaseVC()
    
    var values = [String]() {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    lazy var pickerView = UIPickerView()
    var indexSelect = 0

    var placeHolder = "" {
        didSet {
            lblPlaceHolder.text = " \(placeHolder) "
        }
    }
    
    var valueSelect = "" {
        didSet {
            let isEmpty = valueSelect.isEmpty
            UIView.animate(withDuration: 0.3, animations: {
                self.csTopPlaceHolder.constant = isEmpty ? 16 : -8
                self.lblPlaceHolder.backgroundColor =  .white
                self.lblPlaceHolder.font = UIFont.systemFont(ofSize: isEmpty ? 14 : 12)
                self.lblPlaceHolder.textColor = UIColor(hexString: isEmpty ?  "#989898" : ColorAppHigh )
                self.csLeadingPlaceHolder.constant = isEmpty ? 15 : 10
                self.layoutIfNeeded()
            }) { (result) in
                self.lblTitleSelect.text = self.valueSelect
                self.lblTitleSelect.isHidden = self.lblTitleSelect.text?.isEmpty ?? true
            }
        }
    }
    
    override func commonInit() {
           Bundle.main.loadNibNamed("MySpinner", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = self.bounds
           contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
           setBorderView()
    }
    @IBAction func btnSelect(_ sender: Any) {
        if values.count > 0 {
           showPickerView()
        }else {
            rootVC.showAlertSimple(msg: "Không có dữ liệu để lựa chọn. Vui lòng kiểm tra lại!")
        }
    }
    
    func showPickerView(){
          let optionMenu = UIAlertController(title: "CHỌN VAI TRÒ", message: getHeightPicker(), preferredStyle: .actionSheet)
   
          let selectAction = UIAlertAction(title: "Chọn", style: .default) { (action) in
              self.valueSelect = self.values[self.indexSelect]
          }
          let cancelAction = UIAlertAction(title: "Hủy", style: .cancel)
          optionMenu.addAction(selectAction)
          optionMenu.addAction(cancelAction)
          optionMenu.view.tintColor = UIColor(hexString: ColorAppHigh)
          pickerView = UIPickerView(frame: CGRect(x: 30, y: 20, width: optionMenu.view.frame.width - 80, height: values.count > 5 ? 200 : 150))
          optionMenu.view.addSubview(pickerView)
          pickerView.dataSource = self
          pickerView.delegate = self
          if let row = values.firstIndex(of: valueSelect) {
                 pickerView.selectRow(row, inComponent: 0, animated: true)
          }
          rootVC.present(optionMenu, animated: true, completion: nil)
    }
    
    func getHeightPicker() -> String{
        let isNeedChangeHeight = values.count > 5
        return isNeedChangeHeight ?  "\n\n\n\n\n\n\n\n" : "\n\n\n\n\n\n"
        
    }
    
    func setBorderView(){
          viewBorder.layer.borderColor = UIColor(hexString: ColorAppHigh).cgColor
          viewBorder.layer.borderWidth = 1
      }
    
}

extension MySpinner: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelect = row
    }
}
