//
//  ShipmentStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/29/22.
//

import Foundation

class ShipmentStore: ObservableObject {
    @Published var shipments: [Shipment] = [];
    
    static func load() {
        // get initial list of shipments from the server
    }
    
    static func loadMore() {
        // get more shipments from the server
    }
    
    init() {
    }
    
    init(shipments: [Shipment]) {
        self.shipments = shipments
    }
    
    #if DEBUG
    
    static var example = ShipmentStore(
        shipments: [
            Shipment(id: 6011, origin: "Memphis, TN 38001", destination: "Little Rock, AR 72201", carrier: "AACT", items: 5, weight: 10000, rate: 255),
            Shipment(id: 6012, origin: "Memphis, TN 38001", destination: "Austin, TX 21122", carrier: "PYLE", items: 2, weight: 2000, rate: 500),
            Shipment(id: 6013, origin: "Kansas City, MO 55443", destination: "Brooklyn, NY 11111", carrier: "RLCA", items: 5, weight: 10000, rate: 2400),
        ]
    )
    
    #endif
    
}
