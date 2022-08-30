//
//  ShipmentItem.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct ShipmentItem : Codable, Identifiable {
    var id: Int
    var shipmentId: Int
    var units: Int
    var weight: Decimal
    var description: String
    
    init(id: Int, units: Int, weight: Decimal) {
        self.id = id
        self.units = units
        self.weight = weight
    }
}
