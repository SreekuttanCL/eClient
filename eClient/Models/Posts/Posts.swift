//
//  Posts.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class Posts: Mappable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userId  <- map["userId"]
        id      <- map["id"]
        title   <- map["title"]
        body    <- map["body"]
    }
    
}
