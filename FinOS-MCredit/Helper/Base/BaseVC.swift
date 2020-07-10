//
//  BaseVC.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 6/30/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit


class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func setTitle(type: UINavi = .DEFAULT, title: String, rightAction: String = "") {
           guard let navi = self.navigationController as? BaseNavigationController else { return }
           navi.setUICustomNavi(uiNavi: type, title: title, rightAction: rightAction)
           navi.customNaviView.listenActionRight1 = {[unowned self]  in
               self.actionNaviRight1()
           }
           navi.customNaviView.listenActionRight2 = {[unowned self]  in
                self.actionNaviRight2()
           }
    }
    
    func setImageBtnRight1(image: UIImage) {
        guard let navi = self.navigationController as? BaseNavigationController else { return }
        navi.customNaviView.iconBtnRight1 = image
    }
    
    func setImageBtnRight2(image: UIImage) {
        guard let navi = self.navigationController as? BaseNavigationController else { return }
        navi.customNaviView.iconBtnRight2 = image
    }
       
    func actionNaviRight1(){
           
    }
    
    func actionNaviRight2(){
        
    }
    
    func pushVC(vc: UIViewController,animate: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animate)
    }
       
    func popVC(){
        self.navigationController?.popViewController(animated: true)
    }
       
    func showAlert(title: String, msg: String, titleLeft: String?,  actionLeft: @escaping (() -> Void), titleRight: String?, actionRight: @escaping (() -> Void)) {
           
           let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
           
           if titleLeft != nil {
               let btnLeft = UIAlertAction(title: titleLeft, style: .default) { (action) in
                   actionLeft()
               }
               alert.addAction(btnLeft)
           }
           
           if titleRight != nil {
               let btnRight = UIAlertAction(title: titleRight, style: .default) { (action) in
                   actionRight()
               }
               alert.addAction(btnRight)
           }
           alert.view.tintColor = UIColor(hexString: ColorApp)
           present(alert, animated: true, completion: nil)
    }
    
    func showAlertSimple(msg: String) {
        self.showAlert(title: "", msg: msg, titleLeft: nil, actionLeft: {
            
        }, titleRight: ButtonTitle.COUNTINUE) {
            
        }
    }
}


func Dlog(msg: Any) {
    #if DEBUG
        print("-------> \(msg)")
    #else
    #endif
}
