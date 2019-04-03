//
//  Work.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

struct Work: Codable {
    
    let companyName: String
    let companyCity: String
    let jobTitle: String
    let detail: String
    let start: String
    let end: String?
    let current: Bool
    var workDetails: [WorkDetail] {
        return [WorkDetail(jobTitle: jobTitle, detail: detail, start: start)]
    }
    
    enum CodingKeys: String, CodingKey {
        
        case jobTitle = "companyJobTitle"
        case detail = "companyJobInfo"
        case start = "companyStart"
        case end = "companyEnd"
        case current = "companyCurrent"
        case companyName = "companyName"
        case companyCity = "companyCity"
    }
}

struct WorkDetail: Codable {

    let jobTitle: String
    let detail: String
    let start: String

}


