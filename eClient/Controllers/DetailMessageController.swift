//
//  DetailMessageController.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit

class DetailMessageController: UIViewController {
    

    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var emailMessage: UILabel!
    @IBOutlet weak var emailDescription: UILabel!
    
    var selectedMail : Posts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTitle.text = selectedMail?.title ?? "EMail Title"
        emailMessage.text = selectedMail?.title ?? "Email Message"
        emailDescription.text = selectedMail?.body ?? "Email Description"
    }
}
