//
//  MainVC.swift
//  HansCV
//
//  Created by Hans ter Horst on 06-07-17.
//  Copyright © 2017 Hans ter Horst. All rights reserved.
//

import UIKit
import MessageUI

class MainVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    //MARK: - Properties
    var tableViewArray = [UITableView]()
    var dataAPI = DataAPI.sharedAPI
    var profileData: [Profile]!
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue){}
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var profileText: UITextView!
    
    @IBOutlet weak var viewScroll: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var appStoreButtonLabel: UIButton!
    @IBOutlet weak var skillsButtonLabel: UIButton!
    @IBOutlet weak var workButtonLabel: UIButton!
    @IBOutlet weak var educationButtonLabel: UIButton!
    
    @IBOutlet weak var sliderButtonLabel: UIView!
    
    @IBOutlet var appStoreTV: AppStoreTV!
    @IBOutlet var skillsTV: SkillsTV!
    @IBOutlet var workTV: WorkTV!
    @IBOutlet var educationTV: EducationTV!

    
    //MARK: - Views...
    override func viewDidLoad() {
        super.viewDidLoad()
        profileData = dataAPI.getProfile()
        tableViewArray = [appStoreTV, skillsTV, workTV, educationTV]
        
        scrollView.layer.cornerRadius = 10
        configureProfile()
        loadTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar
        navigationController?.isNavigationBarHidden = true
    }

    
    //MARK: - Functions
    func configureProfile() {
        for item in profileData {
            nameLabel.text = item.name
            jobTitleLabel.text = item.jobTitle
            profileText.text = item.profileText
        }
    }
    
    func loadTableView() {
        
        // Add the tableViews to the scrollView
        for (index, tableView) in tableViewArray.enumerated() {
            scrollView.addSubview(tableView)
            
            // Set the width
            tableView.frame.size.width = UIScreen.main.bounds.width - 32 // - 16 point from leading and trailing constraints
            // Set the height
            tableView.frame.size.height = (UIScreen.main.bounds.height / 2) - 20 // - 20 point from bottom constraints
            // Set the
            tableView.frame.origin.x = CGFloat(index) * (self.view.frame.width - 32) // - 16 point from leading and trailing constraints
            
        }
    }
    
    //sent mail with attachment
    func sendMail() {
        
        //check if the device can send mail
        guard MFMailComposeViewController.canSendMail() else { return }
        
        //mail content
        let mailSubject = "CV van Hans ter Horst"
        let messageBody = "Hoi,\n\nBedankt voor het spontane gesprek.\n Zoals afgesproken zit in de bijlage mijn CV.\n\nGroeten,\n\nHans ter Horst\n06-11902568"
        
        //create an mailVC
        let mailVC = MFMailComposeViewController()
        //set the delegate
        mailVC.mailComposeDelegate = self
        //set the content
        mailVC.setSubject(mailSubject)
        mailVC.setMessageBody(messageBody, isHTML: false)
        
        //get the attachment from the main app's bundle directory
        if let pathName = Bundle.main.path(forResource: "CV-Hans", ofType: ".pdf"),
            let fileData = try? Data(contentsOf: URL(fileURLWithPath: pathName)) {
            
            //set the attachment with the MIME type for the mail attachment,
            //https://www.iana.org/assignments/media-types/media-types.xhtml
            mailVC.addAttachmentData(fileData, mimeType: "application/pdf", fileName: "CV-Hans.pdf")
            
            present(mailVC, animated: true, completion: nil)
        }
    }
    //dismiss the mailVC from screen when the mail is sent
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - IBActions
    
    // Phone call
    @IBAction func website(_ sender: UIButton) {
        if let websiteUrl = URL(string: "https://www.hansth.nl"){
            //URL(string: "tel://" + "+31611902568")
            UIApplication.shared.open(websiteUrl)
        }
    }
    
    // Send email
    @IBAction func sendEmail(_ sender: UIButton) {
        
        sendMail()
    }
    
    // Menu bar slider
    @IBAction func menuBarButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            
            switch sender.tag {
            case 1:
                self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(sender.tag - 1) //(sender.tag - 1), index(0) tableViewArray
                // Set the slider origin and width
                self.sliderButtonLabel.frame.origin.x = self.appStoreButtonLabel.frame.origin.x + 16.0
                self.sliderButtonLabel.frame.size.width = self.appStoreButtonLabel.frame.width
                // Scroll the tableview to the top
                self.appStoreTV.setContentOffset(.zero, animated: false)
            case 2:
                self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(sender.tag - 1) //(sender.tag - 1), index(1) tableViewArray
                self.sliderButtonLabel.frame.origin.x = self.skillsButtonLabel.frame.origin.x + 16.0
                self.sliderButtonLabel.frame.size.width = self.skillsButtonLabel.frame.width
                // Scroll the tableview to the top
                self.skillsTV.setContentOffset(.zero, animated: false)
            case 3:
                self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(sender.tag - 1) //(sender.tag - 1), index(2) tableViewArray
                self.sliderButtonLabel.frame.origin.x = self.workButtonLabel.frame.origin.x + 16.0
                self.sliderButtonLabel.frame.size.width = self.workButtonLabel.frame.width
                // Scroll the tableview to the top
                self.workTV.setContentOffset(.zero, animated: false)
            case 4:
                self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(sender.tag - 1) //(sender.tag - 1), index(3) tableViewArray
                self.sliderButtonLabel.frame.origin.x = self.educationButtonLabel.frame.origin.x + 16.0
                self.sliderButtonLabel.frame.size.width = self.educationButtonLabel.frame.width
                // Scroll the tableview to the top
                self.educationTV.setContentOffset(.zero, animated: false)
                
            default: break
                
            }
        }, completion: nil)
    }
    
    
    //MARK: - Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAppDetailVC" {
            if let indexPath = appStoreTV.indexPathForSelectedRow {
                let item = appStoreTV.appStoreData[indexPath.row]
                let appDetailVC = segue.destination as! AppDetailVC
                appDetailVC.appDetailItem = item
                
                //Set the back button to navigate back in the navigation bar (WebVC).
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
                
            }
        }
    }
    
}
