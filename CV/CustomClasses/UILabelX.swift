//
//  UILabelX.swift
//  LekkerDelden
//
//  Created by Hans ter Horst on 04-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class UILabelX: UILabel {
    
    // Get the screen size
    var view = UIScreen.main
    
    // Calculated value for the font size
    @IBInspectable var size: Int = 1 {
        willSet {
            self.size = newValue
        }
    }
    
    // Make the font size bigger(-1) or smaller(1)
    @IBInspectable var correction: Int = 1 {
        willSet {
            self.correction = newValue
        }
    }
    
    // Set the font size!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let sizeFont = Int((view.bounds.width / CGFloat(size)) - CGFloat(correction))
        self.font = UIFont(name: self.font.fontName, size: CGFloat(sizeFont))
    }

}

