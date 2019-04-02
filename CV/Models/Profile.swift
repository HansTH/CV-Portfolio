//
//  Profile.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct Profile: Codable {
    
    let name: String?
    let jobTitle: String?
    let profileText: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "fullname"
        case jobTitle = "jobtitle"
        case profileText = "bio"
    }
    
}

