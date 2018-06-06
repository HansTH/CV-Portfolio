//
//  Education.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class Education: Codable {
    
    private(set) var educationTitle: String
    private(set) var educationSchool: String
    private(set) var year: Int
    private(set) var educationDetails: [EducationDetail]
    
    init(educationTitle: String, educationSchool: String, year: Int, educationDetails: [EducationDetail]) {
        self.educationTitle = educationTitle
        self.educationSchool = educationSchool
        self.year = year
        self.educationDetails = educationDetails
    }
}

class EducationDetail: Codable {
    private(set) var educationDetail: String
    
    init(educationDetail: String) {
        self.educationDetail = educationDetail
    }
    
}

