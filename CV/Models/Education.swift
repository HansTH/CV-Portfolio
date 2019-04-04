//
//  Education.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct Education: Codable {
    
    let educationTitle: String
    let educationSchool: String
    let start: String
    let end: String
    let current: Bool
    let educationDetails: String
    var educationInfo: [String] {
        return [educationDetails]
    }
    
    enum CodingKeys: String, CodingKey {
        case educationTitle = "eduTitle"
        case educationSchool = "eduSchool"
        case start = "eduStart"
        case end = "eduEnd"
        case current = "eduCurrent"
        case educationDetails = "eduInfo"
    }
    
}
