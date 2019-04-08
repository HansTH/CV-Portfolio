//
//  AppDetailVC.swift
//  CV
//
//  Created by Hans ter Horst on 04/04/2019.
//  Copyright © 2019 Hans ter Horst. All rights reserved.
//

import UIKit

class AppDetailVC: UIViewController, UIScrollViewDelegate {

    var appDetailItem: AppStore!
    var downloadTask = URLSessionDownloadTask()
    let uiScreenWidth = UIScreen.main.bounds.width
    let uiScreenHeight = UIScreen.main.bounds.height
    
    
    //    MARK: - IBOutlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appInfoTextView: UITextView!
    @IBOutlet weak var shadowScrollView: ShadowView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var appYearLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    @IBOutlet weak var appSkillLabel: UILabel!
    @IBOutlet weak var appStoreButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        pageControl.numberOfPages = appDetailItem.screenshots.count
        pageControl.currentPage = 0
        
        let imageString = appDetailItem.icon
        if let imageURL = URL(string: imageString){
            downloadTask = iconImageView.loadAppImage(with: imageURL)
            iconImageView.layer.cornerRadius = 16
            iconImageView.clipsToBounds = true
        }
        
        
        appTitleLabel.text = appDetailItem.title
        appInfoTextView.text = appDetailItem.description
        
        appYearLabel.text = appDetailItem.year
        appCategoryLabel.text = appDetailItem.category
        appSkillLabel.text = appDetailItem.skills.joined(separator: "  • ")
        
        if let _ = appDetailItem.appStoreURL {
            appStoreButton.isHidden = false
            appStoreButton.layer.cornerRadius = appStoreButton.frame.height / 2
            appStoreButton.clipsToBounds = true
        } else {
            appStoreButton.isHidden = true
        }
        
        setupScrollView(screenshots: appDetailItem.screenshots)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupScrollView(screenshots: [String]) {
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(screenshots.count), height: (scrollView.frame.height))
        scrollView.isPagingEnabled = screenshots.count > 1 ? true : false
        scrollView.isScrollEnabled = screenshots.count > 1 ? true : false
        scrollView.layer.cornerRadius = 10
        scrollView.clipsToBounds = true
        
        for i in 0..<screenshots.count {
            let imageView: UIImageView = {
                let image = UIImageView()
                let imageString = screenshots[i]
                if let imageURL = URL(string: imageString){
                    downloadTask = image.loadAppImage(with: imageURL)
                }
                image.contentMode = .scaleAspectFit
                return image
            }()
            
            scrollView.addSubview(imageView)
            // Set the width
            imageView.frame.size.width = shadowScrollView.frame.width
            // Set the height
            imageView.frame.size.height = scrollView.frame.height //((uiScreenWidth * 9 / 16))
            
            // Set the origin
            imageView.frame.origin.x = CGFloat(i) * (shadowScrollView.frame.width) // - 20 point from leading and trailing constraints
        }

    }
    
    
    
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAppstore" {
                let webVC = segue.destination as! WebVC
                webVC.titleApp = appDetailItem.title
                webVC.appURL = appDetailItem.appStoreURL
                
                //Set the back button to navigate back in the navigation bar (WebVC).
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
        }
        
        if segue.identifier == "toWebsite" {
            let webVC = segue.destination as! WebVC
            webVC.titleApp = "HansTH"
            webVC.appURL = "https://thawing-plains-14789.herokuapp.com"
            
            //Set the back button to navigate back in the navigation bar (WebVC).
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
