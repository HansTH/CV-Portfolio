//
//  SkillsTV.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class SkillsTV: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    let skillsData = DataAPI.sharedAPI.getSkills()
    
    
    //MARK: - IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    

    //MARK: - Views
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dataSource = self
        self.delegate = self
    }
    
    
    //MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SkillsTVCell {
            
            let item = skillsData[indexPath.row]
            cell.configureCell(item: item)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
