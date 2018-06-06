//
//  DataManager.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation

class DataManager {
    
    //MARK: - Properties
    private let CV_JSON = "cv.json"
    private var profile = [Profile]()
    private var skill = [Skill]()
    private var appStore = [AppStore]()
    private var work = [Work?]()
    private var education = [Education?]()
    
    
    //MARK: - DataManger methods
    init() {
        loadChecklist()
    }
    
    
    //MARK: - Methods
    func getProfile() -> [Profile] {
        return profile
    }
    
    func getSkills() -> [Skill] {
        return skill
    }
    
    func getAppStore() -> [AppStore] {
        return appStore
    }
    
    func getWork() -> [Work?] {
        return work
    }
    
    func getEducation() -> [Education?] {
        return education
    }
    
    
    //MARK: - Load data methods
    private func documentsDirectory() -> URL {
        //return the URL user’s home directory path
        let errorMessage = "No document directory found in application bundle."
        guard let path = Bundle.main.url(forAuxiliaryExecutable: CV_JSON) else {fatalError(errorMessage)}
        return path
    }
    
    private func loadChecklist() {
        
        //create a instance of JSONDecoder
        let decoder = JSONDecoder()
        
        //try to get the content of the dataFilePath, if nil do nothing
        if let data = try? Data(contentsOf: documentsDirectory()) {
            
            do {
                //try to decode the JSON data into a [Checklist] array
                profile = try decoder.decode(CV.self, from: data).profile
                skill = try decoder.decode(CV.self, from: data).skill
                appStore = try decoder.decode(CV.self, from: data).appStore
                work = try decoder.decode(CV.self, from: data).work
                education = try decoder.decode(CV.self, from: data).education
                
            } //else print error
            catch {
                print("Error decoding data")
            }
        }
    }
    
    
}

