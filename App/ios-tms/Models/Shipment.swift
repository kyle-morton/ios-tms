//
//  Shipment.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct Shipment: Codable, Identifiable {
    
    // simplifing model to the below (for now)
    var id: Int
    var bol: String
    var origin: String
    var destination: String
    var carrier: String
    var items: Int
    var weight: Decimal
    var rate: Decimal
    
    init(id: Int, bol: String, origin: String, destination: String, carrier: String, items: Int, weight: Decimal, rate: Decimal) {
        self.id = id
        self.bol = bol
        self.origin = origin
        self.destination = destination
        self.carrier = carrier
        self.items = items
        self.weight = weight
        self.rate = rate
    }
    
//    var originId: Int?
//    var destinationId: Int?
//    var carrierId: Int?
//    var origin: Address?
//    var destination: Address?
//    var carrier: Carrier?
//    var items: [ShipmentItem]
//    var rate: Decimal?
//    var cost: Decimal?
    
//    init(id: Int, origin: Address, destination: Address, carrier: Carrier, items: [ShipmentItem], customerRate: Decimal) {
//        self.id = id
//        self.origin = origin
//        self.destination = destination
//        self.carrier = carrier
//        self.items = items
//        self.rate = customerRate
//    }
    
    
    
}
