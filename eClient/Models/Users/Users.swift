//
//  Users.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import Foundation
import ObjectMapper


// MARK: - Users
class Users:  Mappable {
    
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        username    <- map["username"]
        email       <- map["email"]
        address     <- map["address"]
        phone       <- map["phone"]
        website     <- map["website"]
    }
    
}
