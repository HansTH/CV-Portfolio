//
//  Work.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class Work: Codable {
    
    private(set) var companyName: String
    private(set) var companyCity: String
    private(set) var year: Int
    private(set) var workDetails: [WorkDetail]
    
    init(companyName: String ,companyCity: String, year: Int, workDetails: [WorkDetail]) {
        self.companyName = companyName
        self.companyCity = companyCity
        self.year = year
        self.workDetails = workDetails
    }
}

class WorkDetail: Codable {
    
    private(set) var jobTitle: String
    private(set) var detail: String
    private(set) var year: Int
    
    init(jobTitle: String, detail: String, year: Int) {
        self.jobTitle = jobTitle
        self.detail = detail
        self.year = year
    }
}


