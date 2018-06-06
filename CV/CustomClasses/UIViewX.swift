//
//  UIViewX.swift
//  LekkerDelden
//
//  Created by Hans ter Horst on 06-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

@IBDesignable

class UIViewX: UIView {
    
    //MARK: Corner radius
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
            clipsToBounds = true
        } else {
            self.layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0
        }
    }
    
    

}

