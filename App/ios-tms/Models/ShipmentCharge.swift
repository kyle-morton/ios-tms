//
//  ShipmentCharge.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

struct ShipmentCharge : Codable, Identifiable {
    var id: Int
    var shipmentId: Int
    var description: String
    var amount: Decimal
    
    internal init(id: Int, shipmentId: Int, description: String, amount: Decimal) {
        self.id = id
        self.shipmentId = shipmentId
        self.description = description
        self.amount = amount
    }
}
