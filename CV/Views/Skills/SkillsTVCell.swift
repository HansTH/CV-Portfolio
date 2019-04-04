//
//  SkillsTVCell.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class SkillsTVCell: UITableViewCell {

    //MARK: - Properties
    var procentView =  UIViewX()
    let colorPallet = ColorPalette()

    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalView: UIViewX!
    

    //MARK: - Views
    override func awakeFromNib() {
        super.awakeFromNib()
        totalView.addSubview(procentView)
        totalView.frame.size.width = UIScreen.main.bounds.width - 64

        procentView.frame.size.height = totalView.frame.height
        procentView.roundCorners = true
    
    }

    func configureCell(item: Skill) {
        let width = totalView.frame.width * CGFloat(Double(item.skillLevel)! / 100)
        
        titleLabel.text = item.skillTitle
        procentView.frame.size.width = width
        procentView.backgroundColor = colorPallet.color(title: item.skillTitle.lowercased())
    }
    
}
