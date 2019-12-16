//
//  Address.swift
//  eClient
//
//  Created by Sreekuttan C L on 2019-12-16.
//  Copyright © 2019 Sreekuttan C L. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - Address
class Address: Mappable {
    var street, suite, city, zipcode: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        street    <- map["street"]
        suite     <- map["suite"]
        city      <- map["city"]
        zipcode   <- map["zipcode"]
    }
}
