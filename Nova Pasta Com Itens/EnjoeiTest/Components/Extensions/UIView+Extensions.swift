//
//  UIView+Rounded.swift
//  ZapPro
//
//  Created by Gerlandio da Silva Lucena on 5/22/15.
//  Copyright (c) 2015 ZAP Imóveis. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor?{
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue?.CGColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get {
            return layer.shadowOffset
        }
        set{
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get {
            return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor?{
        get {
            return  UIColor(CGColor: layer.shadowColor!)
        }
        set{
            layer.shadowColor = newValue?.CGColor
        }
    }
}