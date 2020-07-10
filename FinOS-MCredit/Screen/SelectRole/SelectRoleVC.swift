//
//  SelectRoleVC.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/2/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

class SelectRoleVC: BaseVC {
    
    
    lazy var btnNext = MyButton()
    lazy var checkBox = CheckBox()
    lazy var spinnerRole = MySpinner()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle(type: .HIDE_ALL, title: "Chọn vai trò")
    }
    
    
    func initView(){
        initButton()
        initCheckBox()
        initSpinnerRole()
    }
    
    func initButton(){
        btnNext.title =  "Tiếp theo"
        addView(view: view, subView: btnNext, bottom: -20 , width: self.view.frame.width * 0.7, height: HEIGHT_BUTTON, centerX: true)
          btnNext.onClick = {
            let vc = HomeVC.loadFromNib()
            self.pushVC(vc: vc)
            self.navigationController?.viewControllers = [vc]
          }
    }
    
    func initCheckBox(){
        addView(view: view, subView: checkBox, leading: 10, trailing: -15, bottom: -100, height: 50)
        checkBox.initCheckBox(title: "Ghi nhớ vai trò", isCheck: false)
        checkBox.listenerCheckBox = { isCheck in
        }
    }
    
    func initSpinnerRole(){
        addView(view: view, subView: spinnerRole, leading: 15, trailing: -15, bottom: -160, height: HEIGHT_TEXTFIELD)
        spinnerRole.placeHolder = "CHỌN VAI TRÒ"
        spinnerRole.rootVC = self
        spinnerRole.values = ["Nhân viên bán hàng", "Chủ cửa hàng", "Quản lý cửa hàng"]
    }
    
}
