//
//  LoginVC.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/1/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    @IBOutlet weak var viewBound: UIView!
    
    lazy var checkBox = CheckBox()
    lazy var txtUserName = MyTextField()
    lazy var txtPassWord = MyTextField()
    lazy var btnLogin = MyButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        initView()
    }
    
    func initView(){
        initCheckBox()
        iniTextField()
        initButton()
    }
    
    func iniTextField(){
        self.addView(view: viewBound, subView: txtUserName, leading: 10, trailing:  -10, top: 25, height: HEIGHT_TEXTFIELD)
        self.txtUserName.placeHolder = "Tên đăng nhập"
        self.addView(view: viewBound, subView: txtPassWord, leading: 10, trailing: -10 ,top: HEIGHT_TEXTFIELD + 25, height: HEIGHT_TEXTFIELD)
        self.txtPassWord.placeHolder = "Mật khẩu"
        self.txtPassWord.isCheckSercurity = true
    }
    
    func initCheckBox(){
        addView(view: viewBound, subView: checkBox, leading: 10, bottom: -25, width: 150, height: 50)
        checkBox.initCheckBox(title: "Ghi nhớ", isCheck: false)
        checkBox.listenerCheckBox = { isCheck in
        }
    }
    
    func initButton(){
        btnLogin.title =  "Đăng nhập"
        addView(view: viewBound, subView: btnLogin,top: HEIGHT_TEXTFIELD * 2 + 55, width: self.view.frame.width * 0.65, height: HEIGHT_BUTTON, centerX: true)
        btnLogin.onClick = {
                self.pushVC(vc: SelectRoleVC.loadFromNib())
        }
    }
    
    override func viewDidLayoutSubviews() {
        viewBound.setShadow()
    }
    
}
