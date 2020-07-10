//
//  HomeVC.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 7/3/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    
    @IBOutlet weak var lblTitleHome: UILabel!
    @IBOutlet weak var csTopLblTitleHome: NSLayoutConstraint!
    @IBOutlet weak var viewTotalCase: UIView!
    @IBOutlet weak var csTopViewTotalProfile: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        initBtnRightNavi()
    }
    
    func initBtnRightNavi(){
        setImageBtnRight1(image: UIImage.getImage(named: "ic_user"))
        setImageBtnRight2(image: UIImage.getImage(named: "ic_notification"))
    }
    
    override func actionNaviRight1() {
        let vc = SelectRoleVC.loadFromNib()
        pushVC(vc: vc)
    }
    
    override func actionNaviRight2() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle(type: .HOME, title: "Hồ sơ ngày hôm nay")
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitleHome()
    }
    
    func animateTitleHome(){
        csTopLblTitleHome.constant = -100
        lblTitleHome.alpha = 0.0
        lblTitleHome.isHidden = true
        csTopViewTotalProfile.constant = 50
        view.layoutIfNeeded()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.lblTitleHome.isHidden = false
            UIView.animate(withDuration: 1,animations: {
                                self.csTopLblTitleHome.constant = 25
                                self.lblTitleHome.alpha = 1.0
                                self.view.layoutIfNeeded()
            }) { (result) in   }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.viewTotalCase.isHidden = false
            self.viewTotalCase.alpha = 0.0
            self.contentView.alpha = 0.0
            UIView.animate(withDuration: 1.8,
                           delay: 0.0,
                           usingSpringWithDamping:  0.5,
                           initialSpringVelocity: 0.5,
                           options: [],
                           animations: {
                     self.viewTotalCase.alpha = 1.0
                     self.csTopViewTotalProfile.constant = 10
                     self.view.layoutIfNeeded()
                 }) { (result) in
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 0.5) {
                self.contentView.alpha = 1.0
            }
        }
    }
}
