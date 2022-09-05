//
//  ShipmentStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/29/22.
//

import Foundation

// Store == Service

class ShipmentStore: TmsStoreProctocol {
    @Published var shipments: [Shipment] = [];
    
    static func load() {
        // get initial list of shipments from the server
    }
    
    static func loadMore() {
        // get more shipments from the server
    }
    
    init() {
        self.shipments = []
    }
    
    init(shipments: [Shipment]) {
        self.shipments = shipments
    }
    
    #if DEBUG
    
    static var example = ShipmentStore(
        shipments: [
            Shipment(id: 1, bol: "601001",  origin: "Memphis, TN", destination: "Little Rock, AR", carrier: "AACT", items: 5, weight: 10000, rate: 255),
            Shipment(id: 2, bol: "601002", origin: "Memphis, TN", destination: "Austin, TX", carrier: "PYLE", items: 2, weight: 2000, rate: 500),
            Shipment(id: 3, bol: "601003", origin: "Kansas City, MO", destination: "Brooklyn, NY", carrier: "RLCA", items: 5, weight: 10000, rate: 2400),
        ]
    )
    
    #endif
    
}
