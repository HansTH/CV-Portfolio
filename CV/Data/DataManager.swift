//
//  DataManager.swift
//  CV
//
//  Created by Hans ter Horst on 31-01-18.
//  Copyright © 2018 Hans ter Horst. All rights reserved.
//

import Foundation
typealias DataComplete = (Bool) -> Void
class DataManager {
    
    
    
    
    //MARK: - Properties
    private let CV_URL = URL(string: "https://thawing-plains-14789.herokuapp.com/api/profile/all")
    private let CV_JSON = "cv.json"
    
    private var profile = [Profile]()
    private var skill = [Skill]()
    private var appStore = [AppStore]()
    private var work = [Work?]()
    private var education = [Education?]()
    
    
    //MARK: - DataManger methods
    init() {
        getData(from: CV_URL!)
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

    
    private func getData(from url: URL) {

        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
                do {
                    guard let skills = try decoder.decode([CV].self, from: data)[0].skill else {return}
                    skill = skills
                    guard let appstore = try decoder.decode([CV].self, from: data)[0].appStore else {return }
                    appStore = appstore
                    
                    if let name = try decoder.decode([CV].self, from: data)[0].name,
                    let jobtitle = try decoder.decode([CV].self, from: data)[0].jobTitle,
                    let profiletext = try decoder.decode([CV].self, from: data)[0].profileText {
                    let profileObjext = Profile(name: name, jobTitle: jobtitle, profileText: profiletext)
                    self.profile.append(profileObjext)
                    
                    }
                    
                    print(skill.count)
                }
                catch {
                    print("Error decoding data")
                }
        }
    }
}
