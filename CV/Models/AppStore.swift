//
//  AppStore.swift
//  HansCV
//
//  Created by Hans ter Horst on 10-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import Foundation

class AppStore: Codable {
    
    private(set) var title: String
    private(set) var image: String
    private(set) var description: String
    private(set) var appURL: String?
    
    init(title: String, image: String, description: String, appURL: String) {
        self.title = title
        self.image = image
        self.description = description
        self.appURL = appURL
    }
}
