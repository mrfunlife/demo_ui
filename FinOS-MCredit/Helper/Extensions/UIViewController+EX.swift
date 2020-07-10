//
//  UIViewController+EX.swift
//  ChatFirebaseApp
//
//  Created by Mr FunLife on 7/31/19.
//  Copyright © 2019 Mr FunLife. All rights reserved.
//

import UIKit
import Foundation
protocol ResponseUIViewController {}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            let nameXib = String(describing: T.self)
            guard Bundle.main.path(forResource: nameXib, ofType: "nib") != nil else {
                return T()
            }
            return  T.init(nibName: nameXib, bundle: nil)
        }
        return instantiateFromNib()
    }
    
}


extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? ""
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func setBackGroundOverLay(view: UIView){
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
    func addView(view: UIView, subView: UIView,
                 leading: CGFloat = 0, trailing: CGFloat = 0,
                 bottom: CGFloat = 0, top: CGFloat = 0,
                 width: CGFloat = 0, height: CGFloat = 0,
                 centerY: Bool = false, centerX: Bool = false){
        view.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        subView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0).isActive = centerY
        subView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0).isActive = centerX
        subView.safeLeftAnchor.constraint(equalTo: view.safeLeftAnchor, constant: leading).isActive = leading == 0 ? false : true
        subView.safeBottomAnchor.constraint(equalTo:  view.safeBottomAnchor, constant: bottom).isActive = bottom == 0 ? false : true
        subView.safeRightAnchor.constraint(equalTo: view.safeRightAnchor, constant: trailing).isActive = trailing == 0 ? false : true
        subView.safeTopAnchor.constraint(equalTo:  view.safeTopAnchor, constant: top).isActive = top == 0 ? false : true
        subView.widthAnchor.constraint(equalToConstant: width).isActive = width == 0 ? false : true
        subView.heightAnchor.constraint(equalToConstant: height).isActive = height == 0 ? false : true
        
    }

}

extension UIViewController {
    
    #if DEBUG
    @objc func injected() {
        
        for subview in self.view.subviews {
            subview.removeFromSuperview()
        }
        if let sublayers = self.view.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
        
        viewDidLoad()
    }
    #endif
}
