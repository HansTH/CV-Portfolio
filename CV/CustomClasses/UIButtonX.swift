//
//  UIButtonX.swift
//  LekkerDelden
//
//  Created by Hans ter Horst on 04-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit


@IBDesignable
class UIButtonX: UIButton {    
    
    @IBInspectable var roundCorners: Bool = true {
        willSet {
            self.roundCorners = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        willSet {
            self.layer.cornerRadius = newValue
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        if roundCorners {
            self.layer.cornerRadius = self.layer.bounds.height / 2
            self.clipsToBounds = true
        } else {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = cornerRadius > 0
        }
 
    }
    
}
