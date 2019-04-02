//
//  AppStoreTV.swift
//  HansCV
//
//  Created by Hans ter Horst on 07-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit

class AppStoreTV: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties

    let appStoreData = DataAPI.sharedAPI.getAppStore()
    var downloadTask: URLSessionDownloadTask?
    
    
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
        return appStoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AppStoreTVCell {
            let item = appStoreData[indexPath.row]
            
            cell.titleLabel.text = item.title
//            cell.iconImage.image = UIImage(data: )
            cell.subtitle.text = item.description
                if let imageURL = URL(string: item.icon){
                    downloadTask = cell.iconImage.loadAppImage(with: imageURL)
                }
            return cell
        }
        
        return UITableViewCell()
    }
}
