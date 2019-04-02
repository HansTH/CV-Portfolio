//
//  UIImage+URLSessionDownloadTask.swift
//  CV
//
//  Created by Hans ter Horst on 02/04/2019.
//  Copyright © 2019 Hans ter Horst. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadAppImage(with url: URL) -> URLSessionDownloadTask {
        
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url, completionHandler: { [weak self] url, response, error in
            if error == nil, let url = url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    if let weakself = self {
                        weakself.image = image
                    }
                }
            }
            
        })
        downloadTask.resume()
        return downloadTask
    }
}
