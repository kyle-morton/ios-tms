//
//  CarrierStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

class CarrierStore: TmsStoreProctocol {
    @Published var carriers: [Carrier] = [];
    
    static func load() {
        // get initial list of carriers from the server
    }
    
    static func loadMore() {
        // get more shipments from the server
    }
    
    init() {
        self.carriers = []
    }
    
    init(carriers: [Carrier]) {
        self.carriers = carriers
    }
    
    #if DEBUG
    
    static var example = CarrierStore(
        carriers: [
            Carrier(id: 1, name: "AAA Cooper", scac: "AACT"),
            Carrier(id: 2, name: "R&L Carriers", scac: "RLCA"),
            Carrier(id: 3, name: "Pitt Ohio", scac: "PITT"),
            Carrier(id: 4, name: "FedEx", scac: "FXFE")
        ]
    )
    
    #endif
    
}
