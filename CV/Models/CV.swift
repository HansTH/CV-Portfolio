//
//  CV.swift
//  CV
//
//  Created by Hans ter Horst on 07-04-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct CV: Codable {
    let profile: [Profile]
    let appStore: [AppStore]
    let skill: [Skill]
    let work: [Work]
    let education: [Education]
}
