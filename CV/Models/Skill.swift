//
//  Skill.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class Skill: Codable {
    
    private(set) var skillTitle: String
    private(set) var skillLevel: Int
    private(set) var skillColor: String
    
    init(skillTitle: String, skillLevel: Int, skillColor: String) {
        self.skillTitle = skillTitle
        self.skillLevel = skillLevel
        self.skillColor = skillColor
    }
}

