//
//  WebVC.swift
//  CV
//
//  Created by Hans ter Horst on 12-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKUIDelegate {
    
    var webView = WKWebView()
    var titleApp: String?
    var appURL: String?
    // If the app is not in the Appstore, show all my apps in the store
    let defaultURL = "https://itunes.apple.com/nl/developer/hans-ter-horst/id1170669284"
    
    // Setting for loading the iTunes preview site
    let customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36"

    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the navigation bar
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        // Set the title of the app in the navigation bar
        if let appTitle = titleApp {
            navigationItem.title = appTitle
        }

        view.addSubview(webView)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set the size for the webView
        let frame = CGRect(origin: .zero, size: view.frame.size)
        webView.frame = frame
        
        // Setting for loading the iTunes preview site
        webView.customUserAgent = customUserAgent

        if let appurl = appURL,
            let url = URL(string: appurl) {
            let request = URLRequest(url: url)
            webView.load(request)
            
        } else {
            let request = URLRequest(url: URL(string: defaultURL)!)
            webView.load(request)
        }
    }

}
