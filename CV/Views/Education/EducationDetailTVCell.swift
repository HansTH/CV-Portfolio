//
//  EducationDetailTVCell.swift
//  CV
//
//  Created by Hans ter Horst on 14-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class EducationDetailTVCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var dotImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    // Get the parent cell index for selected ExpansionCell
    private func getParentCellIndex(data: [Education], expansionIndex: Int) -> Int {
        
        var selectedCell: Education?
        var selectedCellIndex = expansionIndex
        
        while(selectedCell == nil && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            selectedCell = data[selectedCellIndex]
        }
        
        return selectedCellIndex
    }

    func configureCell(item: [Education?], indexPath: IndexPath) {
        
        if let item = item[indexPath.row] {
            
            //  Get the index of the parent Cell (containing the data)
            let parentCellIndex = getParentCellIndex(data: [item], expansionIndex: indexPath.row)
            
            //  Get the index of the education data (e.g. if there are multiple ExpansionCells
            let detailIndex = indexPath.row - parentCellIndex - 1
            
            //  Set the cell's data
            detailLabel.text = item.educationDetails[detailIndex].educationDetail
 
        }
    }
}
