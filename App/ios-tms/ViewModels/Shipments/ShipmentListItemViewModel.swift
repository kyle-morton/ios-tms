//
//  Shipment.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct ShipmentListItemViewModel : Identifiable {
    var id: Int
    var originLabel: String
    var destinationLabel: String
    var items: Int
    var totalWeight: Decimal
    var rate: Decimal
}
