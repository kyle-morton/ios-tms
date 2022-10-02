//
//  CreateQuoteViewMode.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/18/22.
//

import Foundation

struct QuoteCreateViewModel : Codable {
    
    var origin: String
    var destination: String
    var items: Int
    var weight: Decimal
    var pickupDate: String
    
    init(origin: String, destination: String, items: Int, weight: Decimal, pickupDate: Date) {
        self.origin = origin
        self.destination = destination
        self.items = items
        self.weight = weight
        self.pickupDate = pickupDate.getFormattedDate(format: "MM/dd/yyyy")
    }
    
}
