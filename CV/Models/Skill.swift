//
//  Skill.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct Skill: Codable {
    
    let skillTitle: String
    let skillLevel: String
    
    enum CodingKeys: String, CodingKey{
        case skillTitle = "title"
        case skillLevel = "level"
    }
}

