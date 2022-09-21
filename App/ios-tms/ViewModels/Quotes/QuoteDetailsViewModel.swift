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
//    var pickupDate: Date
    var pickupDateFormatted: String
    var rates: [QuoteRateViewModel]
    
    init(id: Int, origin: String, destination: String, items: Int, weight: Decimal, pickupDateFormatted: String, rates: [QuoteRateViewModel]) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.items = items
        self.weight = weight
        self.weightFormatted = "\(weight)"
//        self.pickupDate = pickupDate
        self.pickupDateFormatted = pickupDateFormatted
        self.rates = rates
    }
    
    init(vm: QuoteIndexItemViewModel) {
        self.id = vm.id
        self.origin = vm.origin
        self.destination = vm.destination
        self.items = vm.items
        self.weight = vm.weight
        self.weightFormatted = vm.weightFormatted
//        self.pickupDate = Date("10/1/22", strategy: .dateTime)
        self.pickupDateFormatted = "\("9/20/22")"
        self.rates = []
    }
    
    init() {
        self.id = 0
        self.origin = ""
        self.destination = ""
        self.items = 0
        self.weight = 0
        self.weightFormatted = ""
        self.pickupDateFormatted = ""
        self.rates = []
    }
    
}

