//
//  AppStore.swift
//  HansCV
//
//  Created by Hans ter Horst on 10-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import Foundation

struct AppStore: Codable {
    
    let title: String
    let screenshots: [String]
    let description: String
    let appURL: String?
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case title = "appTitle"
        case screenshots = "appScreenshots"
        case description = "appInfo"
        case icon = "appIcon"
        case appURL
    }
}
