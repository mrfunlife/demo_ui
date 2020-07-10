//
//  CustomNavigationView.swift
//  DemoApp
//
//  Created by Pham Hoang Ha on 1/17/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

enum UINavi {
    case HOME
    case DEFAULT
    case HIDE_ALL
}

class CustomNavigationView: BaseView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnRight2: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var csLeadingImgLogo: NSLayoutConstraint!
    
    var listenActionLeft: (() -> ())?
    var listenActionRight1: (() -> ())?
    var listenActionRight2: (() -> ())?
    
    var iconBtnRight1 =  UIImage() {
        didSet {
            btnRight.isHidden = false
            btnRight.setImage(iconBtnRight1, for: .normal)
        }
    }
    
    var iconBtnRight2 =  UIImage() {
        didSet {
            btnRight2.isHidden = false
            btnRight2.setImage(iconBtnRight2, for: .normal)
        }
    }
    
    @IBAction func btnLeft(_ sender: Any) {
        listenActionLeft?()
    }
    
    @IBAction func btnRight(_ sender: Any) {
        listenActionRight1?()
    }

    @IBAction func btnRight2(_ sender: Any) {
        listenActionRight2?()
    }
    
    override func commonInit() {
        Bundle.main.loadNibNamed("CustomNavigationView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    func setUINavi(uiNavi: UINavi, title: String, rightAction: String){
        
        let isHome = uiNavi == .HOME
        let isHideAll = uiNavi == .HIDE_ALL
        
        contentView.backgroundColor = isHome ? .white :  UIColor(hexString: ColorBGNavi)
        
        imgLogo.isHidden = !isHome
        if isHome {
            animationLogo()
        }
        //Button
        btnLeft.isHidden = (isHome || isHideAll)
        btnRight.isHidden = !isHome
        btnRight2.isHidden = !isHome
        
        
        //Xu ly title
        lblTitle.isHidden = isHome
        lblTitle.text = title
        lblTitle.font = UIFont.systemFont(ofSize: (isHideAll || isHome) ? 17 : 14, weight: (isHideAll || isHome) ? .bold : .semibold)
        lblTitle.textColor = isHome ? UIColor(hexString: ColorText) : .white
        
        UIView.transition(with: self.lblTitle, duration: 0.9, options: .transitionFlipFromRight, animations: {
            self.lblTitle.textAlignment = isHome ? .left : .center
        }){ (result) in}
        
    }
    
    func animationLogo(){
        csLeadingImgLogo.constant = 200.0
        imgLogo.alpha = 0.0
        layoutIfNeeded()
        UIView.animate(withDuration: 1.0,
                        delay: 0.0,
                        options: [],
                        animations: {
                            self.csLeadingImgLogo.constant = 20
                            self.imgLogo.alpha = 1.0
                            self.layoutIfNeeded()
        }) { (result) in}
    }
    

    
    
}
