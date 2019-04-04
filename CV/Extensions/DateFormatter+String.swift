//
//  DateFormatter+String.swift
//  CV
//
//  Created by Hans ter Horst on 03/04/2019.
//  Copyright © 2019 Hans ter Horst. All rights reserved.
//

import Foundation

extension String {
    
    func formatDate(to dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd'T'hh:mm:ss.ssZ"
        formatter.locale = .current
        if let date = formatter.date(from: self) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = dateFormat
            return displayFormatter.string(from: date)
        } else {
            return "Unknow"
        }
    }
    
}
