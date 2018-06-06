//
//  Profile.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class Profile: Codable {
    
    private(set) var name: String
    private(set) var jobTitle: String
    private(set) var profileText: String
    
    init(name: String, jobTitle: String, profileText: String) {
        self.name = name
        self.jobTitle = jobTitle
        self.profileText = profileText
    }
}

