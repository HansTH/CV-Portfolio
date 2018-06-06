//
//  ShadowView.swift
//  LekkerDelden
//
//  Created by Hans ter Horst on 06-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    //MARK: - Shadow
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = self.shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = self.shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = self.shadowOpacity
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = self.shadowOffset
        }
    }
    
    
    //MARK: - Corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
    }


}
