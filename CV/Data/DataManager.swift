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
    private let CV_URL = URL(string: "https://www.hansterhorst.com/api/profile/all")
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
        return work.sorted(by: { $0!.start > $1!.start})
    }
    
    func getEducation() -> [Education?] {
        return education.sorted(by: { $0!.start > $1!.start})
    }
    
    
    private func getData(from url: URL) {
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                
                if let name = try decoder.decode([CV].self, from: data)[0].name,
                    let jobtitle = try decoder.decode([CV].self, from: data)[0].jobTitle,
                    let profiletext = try decoder.decode([CV].self, from: data)[0].profileText,
                    let website = try decoder.decode([CV].self, from: data)[0].website,
                    let email = try decoder.decode([CV].self, from: data)[0].email,
                    let mobile = try decoder.decode([CV].self, from: data)[0].mobile {
                    let profileObjext = Profile(name: name, jobTitle: jobtitle, profileText: profiletext,
                                                website: website, mobile: mobile, email: email)
                    self.profile.append(profileObjext)
                    
                    guard let skills = try decoder.decode([CV].self, from: data)[0].skill else {return}
                    skill = skills
                    
                    guard let appstore = try decoder.decode([CV].self, from: data)[0].appStore else {return }
                    appStore = appstore
                    
                    guard let education = try decoder.decode([CV].self, from: data)[0].education else {return}
                    self.education = education
                    
                    guard let experience = try decoder.decode([CV].self, from: data)[0].work else {return}
                    work = experience
                    
                }
            }
            catch {
                print("Error decoding data")
            }
        }
    }
}
