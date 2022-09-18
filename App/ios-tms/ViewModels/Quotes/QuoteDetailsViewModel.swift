//
//  QuoteDetailsViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/17/22.
//

import Foundation

struct QuoteDetailsViewModel : Identifiable, Codable {

    var id: Int
    var origin: String
    var destination: String
    var items: Int
    var weight: Decimal
    var weightFormatted: String
    var rates: [QuoteRateViewModel]
    
    init(id: Int, origin: String, destination: String, items: Int, weight: Decimal, rates: [QuoteRateViewModel]) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.items = items
        self.weight = weight
        self.weightFormatted = "\(weight)"
        self.rates = rates
    }
    
}

