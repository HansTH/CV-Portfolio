//
//  WorkTV.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class WorkTV: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    var workData: [Work?]? = DataAPI.sharedAPI.getWork()
    
    //MARK: - IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    //MARK: - Views
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Tableview Delegates
        self.dataSource = self
        self.delegate = self
    }
    
    
    //MARK: - Methodes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = workData?.count {
            return count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // WorkCell
        if let workItem = workData?[indexPath.row] {
            
            let workCell = tableView.dequeueReusableCell(withIdentifier: "WorkCell", for: indexPath) as! WorkTVCell
            
            workCell.titleLabel.text = workItem.companyName
            workCell.subTitleLabel.text = workItem.companyCity
            workCell.yearLabel.text = String(workItem.year)
            
            if workItem.companyName == (workData?.first)!?.companyName {
                workCell.imageLabel.image = UIImage(named: "greenDotBegin")
            } else if workItem.year == (workData?.last)!?.year {
                workCell.imageLabel.image = UIImage(named: "greenDotEnd")
            } else {
                workCell.imageLabel.image = UIImage(named: "greenDotMiddle")
            }
            
            workCell.selectionStyle = .none
            
            return workCell
        }
        // WorkDetailCell (expandCell)
        else {
            
            if let item = workData?[getParentCellIndex(expansionIndex: indexPath.row)] {
                
                //  Create an detailCell
                let detailCell = tableView.dequeueReusableCell(withIdentifier: "WorkDetailCell", for: indexPath) as! WorkDetailTVCell
                
                //  Get the index of the parent Cell (containing the data)
                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
                
                //  Get the index of the workData (e.g. if there are multiple ExpansionCells
                let detailIndex = indexPath.row - parentCellIndex - 1
                
                //  Set the cell's data
                detailCell.titleLabel .text = item.workDetails[detailIndex].jobTitle
                detailCell.detailLabel.text = item.workDetails[detailIndex].detail
                detailCell.yearLabel.text = String(item.workDetails[detailIndex].year)
                
                detailCell.selectionStyle = .none
                
                return detailCell
            }
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // If user clicked last cell
        if(indexPath.row + 1 >= (workData?.count)!) {
            expandCell(tableView: tableView, indexPath: indexPath.row)
        } else {
            // If next cell is not nil, then cell is not expanded
            if(workData?[indexPath.row + 1] != nil) {
                expandCell(tableView: tableView, indexPath: indexPath.row)
                
            // Close Cell (remove ExpansionCells)
            } else {
                removeCell(tableView: tableView, indexPath: indexPath.row)
                
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let _ = workData?[indexPath.row] {
            // Set the height of the WorkCell
            return 80
        } else {
            // Set the height of the WorkDetailCell
            return 100
        }
    }
    
    
    
    //  Expand WorkDetailTVCell at given index
    private func expandCell(tableView: UITableView, indexPath: Int) {
        
        if let workDetails = workData?[indexPath]?.workDetails {
            for i in 1...workDetails.count {
                workData?.insert(nil, at: indexPath + i)
                tableView.insertRows(at: [NSIndexPath(row: indexPath + i, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    // Remove WorkDetailTVCell at given index
    private func removeCell(tableView: UITableView, indexPath: Int) {
        
        if let workDetails = workData?[indexPath]?.workDetails {
            for _ in 1...workDetails.count {
                workData?.remove(at: indexPath + 1)
                tableView.deleteRows(at: [NSIndexPath(row: indexPath + 1, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    // Get the parent cell index for selected ExpansionCell
    private func getParentCellIndex(expansionIndex: Int) -> Int {
        
        var selectedCell: Work?
        var selectedCellIndex = expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            selectedCell = workData?[selectedCellIndex]
        }
        
        return selectedCellIndex
    }
    
    
}
