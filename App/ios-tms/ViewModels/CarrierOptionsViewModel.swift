//
//  CarrierOptionsViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/18/22.
//

import Foundation

struct CarrierOption: Identifiable, Hashable, Codable {
    var id: Int
    var name: String
    var scac: String
    
    init(id: Int, name: String, scac: String) {
        self.id = id
        self.name = name
        self.scac = scac
    }
}
