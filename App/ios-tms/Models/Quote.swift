//
//  Quote.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/13/22.
//

import Foundation

struct Quote : Identifiable, Codable {

    var id: Int
    var origin: String
    var destination: String
    var items: Int
    var weight: Decimal
    var lowestRate: Decimal
    var lowestRateFormatted: String
    var highestRate: Decimal
    var highestRateFormatted: String
    var rateCount: Int
    
    init(id: Int, origin: String, destination: String, items: Int, weight: Decimal, lowestRate: Decimal, lowestRateFormatted: String, highestRate: Decimal, highestRateFormatted: String, rateCount: Int) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.items = items
        self.weight = weight
        self.lowestRate = lowestRate
        self.lowestRateFormatted = lowestRateFormatted
        self.highestRate = highestRate
        self.highestRateFormatted = highestRateFormatted
        self.rateCount = rateCount
    }
    
}
