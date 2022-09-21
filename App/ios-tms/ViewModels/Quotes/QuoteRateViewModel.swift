//
//  QuoteRateViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/17/22.
//

import Foundation

struct QuoteRateViewModel : Identifiable, Codable {
    
    var id: Int
    var quoteId: Int
    var carrier: String
    var rate: Decimal
    var rateFormatted: String
    var cost: Decimal
    var costFormatted: String
//    var pickupDate: Date
    var pickupDateFormatted: String
//    var estDeliveryDate: Date
    var estDeliveryDateFormatted: String
    
}
