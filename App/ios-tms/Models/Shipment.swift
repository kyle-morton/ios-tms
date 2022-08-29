//
//  Shipment.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct Shipment: Codable, Identifiable {
    var id: Int
    var originId: Int
    var destinationId: Int
    var carrierId: Int
    var origin: Address
    var destination: Address
    var carrier: Carrier
    var items: [ShipmentItem]
    var rate: Decimal
    var cost: Decimal
    
}
