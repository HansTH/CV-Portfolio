//
//  DataAPI.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class DataAPI {
    
    //MARK: - Properties
    private let dataManager = DataManager()
    
    
    //MARK: - Singleton DataAPI
    static let sharedAPI = DataAPI()
    private init() {}

    
    //MARK: - Methods
    func getProfile() -> [Profile] {
        return dataManager.getProfile()
    }
    
    func getSkills() -> [Skill] {
        return dataManager.getSkills()
    }

    func getAppStore() -> [AppStore] {
        return dataManager.getAppStore()
    }

    func getWork() -> [Work?] {
        return dataManager.getWork()
    }

    func getEducation() -> [Education?] {
        return dataManager.getEducation()
    }

}

