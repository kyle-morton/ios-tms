//
//  Carrier.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct Carrier: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var scac: String
    
    init(id: Int, name: String, scac: String) {
        self.id = id
        self.name = name
        self.scac = scac
    }
}
