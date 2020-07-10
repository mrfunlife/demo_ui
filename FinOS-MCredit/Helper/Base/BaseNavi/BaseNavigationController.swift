//
//  BaseNavigationController.swift
//  DemoApp
//
//  Created by Pham Hoang Ha on 1/20/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import Foundation
import UIKit


let HEIGHT_STATUS_BAR = UIApplication.shared.statusBarFrame.height

class BaseNavigationController: UINavigationController {
    
    var customNaviView = CustomNavigationView()
    var statusBarView = UIView()
    
    var colorStatusBar: UIColor  = .white{
        didSet {
            self.statusBarView.backgroundColor = colorStatusBar
        }
    }
    let menuView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        self.navigationBar.tintColor = .clear
        self.interactivePopGestureRecognizer?.isEnabled = false
        customNaviView = CustomNavigationView.init(frame: self.navigationBar.frame)
        self.navigationBar.addSubview(customNaviView)
        addStatusBarView()
    }
    
    
    
    func addStatusBarView(){
        statusBarView = UIView(frame: CGRect(x: 0,y: -HEIGHT_STATUS_BAR, width: self.view.frame.width, height: HEIGHT_STATUS_BAR))
        customNaviView.insertSubview(statusBarView, at: 0)
        statusBarView.backgroundColor = .white
    }
    
    func setUICustomNavi(uiNavi: UINavi, title: String, rightAction: String) {
        colorStatusBar = uiNavi == .HOME ? .white : UIColor(hexString: ColorBGNavi)
        uiNavi == .HOME ? removeBorderNavi() : restoreBorderNavi()
        self.navigationBar.backIndicatorImage = nil
        customNaviView.setUINavi(uiNavi: uiNavi, title: title, rightAction: rightAction)
    }
    
    func removeBorderNavi(){
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layoutIfNeeded()
    }
    
    func restoreBorderNavi(){
        self.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationBar.shadowImage = nil
        self.navigationBar.layoutIfNeeded()
    }
    

    
}

