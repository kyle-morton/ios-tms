//
//  QuoteIndexItemViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/17/22.
//

import Foundation

struct QuoteIndexItemViewModel : Identifiable, Codable {

    var id: Int
    var origin: String
    var destination: String
    var items: Int
    var weight: Decimal
    var weightFormatted: String
    var lowestRate: Decimal
    var lowestRateFormatted: String
    var highestRate: Decimal
    var highestRateFormatted: String
    var rateCount: Int
    var pickupDateFormatted: String
    
    init(id: Int, origin: String, destination: String, items: Int, weight: Decimal, lowestRate: Decimal, lowestRateFormatted: String, highestRate: Decimal, highestRateFormatted: String, pickupDateFormatted: String, rateCount: Int) {
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
        self.weightFormatted = "\(weight)"
        self.pickupDateFormatted = pickupDateFormatted
    }
    
}
