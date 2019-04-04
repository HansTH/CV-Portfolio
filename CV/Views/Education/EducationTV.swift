//
//  EducationTV.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class EducationTV: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    var educationData: [Education?]? = DataAPI.sharedAPI.getEducation()
    
    
    //MARK: - IBinspectable
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
    
    
    //MARK: - Methodes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = educationData?.count {
            return count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Education cell
        if let item = educationData?[indexPath.row] {
            
            let educationCell = tableView.dequeueReusableCell(withIdentifier: "EducationCell", for: indexPath) as! EducationTVCell
            
            educationCell.titleLabel.text = item.educationTitle
            educationCell.subTitleLabel.text = item.educationSchool
            educationCell.yearLabel.text = String(item.start.formatDate(to: "y"))
            
            if item.educationTitle == (educationData?.first)??.educationTitle {
                educationCell.imageLabel.image = UIImage(named: "blueDotBegin")
            } else if item.start == (educationData?.last)??.start {
                educationCell.imageLabel.image = UIImage(named: "blueDotEnd")
            } else {
                educationCell.imageLabel.image = UIImage(named: "blueDotMiddle")
            }
            
            educationCell.selectionStyle = .none
            
            return educationCell
        }
            // EducationDetail Cell
        else {
            if let item = educationData?[getParentCellIndex(expansionIndex: indexPath.row)] {
                //  Create an ExpansionCell
                let detailCell = tableView.dequeueReusableCell(withIdentifier: "EducationDetailCell", for: indexPath) as! EducationDetailTVCell
                
                //  Get the index of the parent Cell (containing the data)
                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
                
                //  Get the index of the education data (e.g. if there are multiple ExpansionCells
                let detailIndex = indexPath.row - parentCellIndex - 1
                
                //  Set the cell's data
                detailCell.detailLabel.text = item.educationInfo[detailIndex]
                
                detailCell.selectionStyle = .none
                
                return detailCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // If user clicked last cell
        if(indexPath.row + 1 >= (educationData?.count)!) {
            expandCell(tableView: tableView, indexPath: indexPath.row)
        } else {
            // If next cell is not nil, then cell is not expanded
            if(educationData?[indexPath.row + 1] != nil) {
                expandCell(tableView: tableView, indexPath: indexPath.row)
            
            // Close Cell (remove ExpansionCells)
            } else {
                removeCell(tableView: tableView, indexPath: indexPath.row)
                
            }
        }
    }
    
    //  Expand EducationDetailTVCell at given index
    private func expandCell(tableView: UITableView, indexPath: Int) {
        
        if let educationDetails = educationData?[indexPath]?.educationInfo {
            for i in 1...educationDetails.count {
                educationData?.insert(nil, at: indexPath + i)
                tableView.insertRows(at: [NSIndexPath(row: indexPath + i, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    // Remove EducationDetailTVCell at given index
    private func removeCell(tableView: UITableView, indexPath: Int) {
        
        if let educationDetails = educationData?[indexPath]?.educationInfo {
            for _ in 1...educationDetails.count {
                educationData?.remove(at: indexPath + 1)
                tableView.deleteRows(at: [NSIndexPath(row: indexPath + 1, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    
    // Get the parent cell index for selected ExpansionCell
    private func getParentCellIndex(expansionIndex: Int) -> Int {
        
        var selectedCell: Education?
        var selectedCellIndex = expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            selectedCell = educationData?[selectedCellIndex]
        }
        
        return selectedCellIndex
    }
    
    
}
