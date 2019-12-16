//
//  ArchiveViewController.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit
var archives = [Dictionary<String, String>()]

class ArchiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var archiveTabelView: UITableView!
    
    var posts = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "archiveCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArchieveTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InboxTable.")
        }
        
        cell.labelEmail.text = archives[indexPath.row]["title"]
        cell.labelSubject.text = archives[indexPath.row]["title"]
        cell.labelMessage.text = archives[indexPath.row]["body"]
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "showMessage", let destination = segue.destination as? DetailMessageController,
            let messageIndex = archiveTabelView.indexPathForSelectedRow?.row
        {
            
            destination.selectedMail =  posts[messageIndex]
        }
        
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 150.0;//Your custom row height
    }
}
