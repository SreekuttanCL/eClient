//
//  SendListViewController.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit

class SendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var sendListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sendMails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "sendMailTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? sendTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SendTable.")
        }
        
        cell.labelEmail.text = sendMails[indexPath.row]["title"]
        cell.labelSubject.text = sendMails[indexPath.row]["title"]
        cell.labelMessage.text = sendMails[indexPath.row]["body"]
        
        return cell
    }
}
