//
//  WebVC.swift
//  CV
//
//  Created by Hans ter Horst on 12-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    var titleApp: String?
    var appURL: String?
    
    // If the app is not in the Appstore, show all my apps in the store
    let defaultURL = "https://www.hansterhorst.com"
    
    //MARK: - Views
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
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

        webView.allowsBackForwardNavigationGestures = false
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
