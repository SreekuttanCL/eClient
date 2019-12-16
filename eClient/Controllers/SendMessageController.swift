//
//  SendMessageController.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class SendMessageController: UIViewController {
    
    @IBOutlet weak var sendToMail: UITextField!
    @IBOutlet weak var CCMail: UITextField!
    @IBOutlet weak var subjectMail: UITextField!
    @IBOutlet weak var sendMessage: UITextView!
    
    var posts = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func sendBtn(_ sender: Any) {
        postMessage()
    }
    
    func postMessage() {
        
        let parameters: [String: String] = ["userId": "100", "Id":"100", "title":sendToMail.text!, "body": sendMessage.text! ]
        
        //Checking internet connection
        if Connectivity.isConnectedToInternet {
            
            Alamofire.request(baseURL + "posts/", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                print(response)
            }
        }
        else {
            //No internet connection alert
            showAlert(withTitle: "No Internet Connection", withMessage: "Kindly check your internet connection")
        }
    }
}
