//
//  ColorPalette.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import UIKit

class ColorPalette {
    
    //    case swift, xcode, sketch, js, css, html, git, mysql, threeD, dutch, english
    
    func color(title: String) -> UIColor {
        switch title {
        case "swift": return #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case "xcode": return #colorLiteral(red: 0.2392156869, green: 0.5293546584, blue: 0.7433127828, alpha: 1)
        case "developer": return #colorLiteral(red: 0.4318714142, green: 0.8210262656, blue: 0.1092776284, alpha: 1)
        case "ios": return #colorLiteral(red: 0.5568627715, green: 0.4139492147, blue: 0.9686274529, alpha: 1)
        case "react": return #colorLiteral(red: 0.2588235438, green: 0.8134220044, blue: 1, alpha: 1)
        case "sketch": return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        case "git": return #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        case "mysql": return #colorLiteral(red: 0.9292292263, green: 0.2992238098, blue: 0.3097239001, alpha: 1)
        case "3d": return #colorLiteral(red: 0.8503960503, green: 0.2149736485, blue: 0.8503960503, alpha: 1)
        case "dutch": return #colorLiteral(red: 1, green: 0.6242604256, blue: 0, alpha: 1)
        case "english": return #colorLiteral(red: 0.9738592505, green: 0.2139115632, blue: 0.1644435227, alpha: 1)
        default:
            return UIColor.lightGray
        }
    }
}

