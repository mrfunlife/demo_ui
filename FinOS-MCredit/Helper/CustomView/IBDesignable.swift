//
//  BorderView.swift
//  FinOS-MCredit
//
//  Created by Pham Hoang Ha on 6/30/20.
//  Copyright © 2020 Mcredit. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
}



@IBDesignable
class BackgroundView: UIView {

    @IBInspectable var bgColor: UIColor = UIColor.clear {
        didSet {
            self.backgroundColor = UIColor(hexString: ColorApp) 
        }
    }
}



@IBDesignable
class ButtonGradient: UIButton {
    
    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        if (self.isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
        
        self.layer.cornerRadius = self.cornerRadiusValue
        self.clipsToBounds = true
    }
}



