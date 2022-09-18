//
//  ShipmentDetailsViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/17/22.
//

import Foundation

struct ShipmentDetailsViewModel: Identifiable, Codable {
    
    // simplifing model to the below (for now)
    var id: Int
    var bol: String
    var origin: String
    var destination: String
    var carrier: String
    var items: Int
    var weight: Decimal
    var weightFormatted: String
    var rate: Decimal
    var rateFormatted: String
    var isPaid: Bool
    var statusTypeId: Int
    var statusHumanized: String
    
    init(id: Int, bol: String, origin: String, destination: String, carrier: String, items: Int, weight: Decimal, rate: Decimal, isPaid: Bool, statusTypeId: Int, statusHumanized: String) {
        self.id = id
        self.bol = bol
        self.origin = origin
        self.destination = destination
        self.carrier = carrier
        self.items = items
        self.weight = weight
        self.rate = rate
        self.isPaid = isPaid
        self.rateFormatted = "\(self.rate)"
        self.statusTypeId = statusTypeId
        self.statusHumanized = statusHumanized
        self.weightFormatted = "\(weight)"
    }
    
    init(origin: String, destination: String) {
        self.id = 0
        self.bol = ""
        self.origin = origin;
        self.destination = destination;
        self.carrier = "CNWY"
        self.items = 5
        self.weight = 9999
        self.weightFormatted = "\(9999)"
        self.rate = 0
        self.isPaid = false
        self.rateFormatted = "\(self.rate)"
        self.statusTypeId = 1
        self.statusHumanized = "Pending"
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

