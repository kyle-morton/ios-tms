//
//  Address.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct Address: Codable, Identifiable {
    var id: Int
    var addressLineOne: String
    var addressLineTwo: String
    var city: String
    var state: String
    var zipCode: String
    
    var label: String {
        return "\(city), \(state) \(zipCode)"
    }
    
    init(id: Int, city: String, state: String, zipCode: String) {
        self.id = id
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.addressLineOne = ""
        self.addressLineTwo = ""
    }
}
