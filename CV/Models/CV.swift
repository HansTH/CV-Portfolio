//
//  CV.swift
//  CV
//
//  Created by Hans ter Horst on 07-04-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct CV: Codable {
//    let profile: [Profile]!
    let appStore: [AppStore]?
    let skill: [Skill]?
    let work: [Work?]?
    let education: [Education?]?
    let name: String?
    let jobTitle: String?
    let profileText: String?

    
    enum CodingKeys: String, CodingKey {
        case name = "fullname"
        case jobTitle = "jobtitle"
        case profileText = "bio"
        case skill
        case appStore = "portfolio"
        case education
        case work = "experience"
    }
}
