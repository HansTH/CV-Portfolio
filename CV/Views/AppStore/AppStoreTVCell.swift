//
//  AppStoreTVCell.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class AppStoreTVCell: UITableViewCell {
    
    //    MARK: - Propeties
    var downloadTask: URLSessionDownloadTask?
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImage.layer.cornerRadius = 20
        iconImage.clipsToBounds = true
    }
    
    func configuteCell(item: AppStore) {
        titleLabel.text = item.title
        subtitle.text = item.description
        if let imageURL = URL(string: item.icon){
            downloadTask = iconImage.loadAppImage(with: imageURL)
        }
    }
}
