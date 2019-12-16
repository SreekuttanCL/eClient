//
//  ViewController.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet weak var inboxTableView: UITableView!
    
    var showMenu = false
    var posts = [Posts]()
    
    //Pull to Refresh table view content control
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setting up large titles in nav bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //Setting Nav bar title
        self.navigationItem.title = "Inbox"
        
        //Implmenting Pull to refresh control in table view
        refreshTableView()
        
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "InBoxTableCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InboxTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InboxTable.")
        }
        
        let post = posts[indexPath.row]
        cell.labelName.text = post.title
        cell.labelMessage.text = "Message to be displayed"
        cell.labelDescription.text = post.body
        
        return  cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            self.posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // share item at indexPath
            print("I want to share: \(self.posts[indexPath.row])")
        }

        share.backgroundColor = UIColor.lightGray

        return [delete, share]

    }
    
    func fetchData() {
        // Activate Activity Spinner
        self.showSpinner(onView: self.view)
        
        //Checking internet connection
        if Connectivity.isConnectedToInternet {
            
            // Calling Users list api using Alamofire
            Alamofire.request(baseURL + "posts/").responseArray { (response: DataResponse<[Posts]>) in
                
                //response from api
                self.posts = response.result.value ?? []
                
                //Reloading table view with new data
                self.inboxTableView.reloadData()
                
                // Deactivate Activity Spinner
                self.removeSpinner()
            }
        }
        else {
            //No internet connection alert
            showAlert(withTitle: "No Internet Connection", withMessage: "Kindly check your internet connection")
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "showMessage", let destination = segue.destination as? DetailMessageController,
            let messageIndex = inboxTableView.indexPathForSelectedRow?.row
        {
            
            destination.selectedMail =  posts[messageIndex]
        }
        
    }

    @IBAction func openMenu(_ sender: Any) {
        
        if (showMenu) {
            
            //menu is showing => close it
            leadingConstraint.constant = -307
            viewBackground.backgroundColor = UIColor.white
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            
        }
        else {
            
            //menu is closed => show it
            leadingConstraint.constant = 0
            viewBackground.backgroundColor = UIColor.darkGray
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            
        }
        showMenu = !showMenu
    }
    
    // Add Refresh control to tableview.
    func refreshTableView() {
        // Refresh control add in tableview.
        // refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.inboxTableView.addSubview(refreshControl)
        
    }
    
    @objc func refresh(_ sender: Any) {
        //Re-Fetching user Data
        fetchData()
        
        // Refreshing Ends
        refreshControl.endRefreshing()
        
        
    }
    
}

