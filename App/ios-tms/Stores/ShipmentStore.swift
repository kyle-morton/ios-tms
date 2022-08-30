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
    
    #if DEBUG
    
    static let example = [Shipment] {
        Shipment(id: <#T##Int?#>, originId: <#T##Int?#>, destinationId: <#T##Int?#>, carrierId: <#T##Int?#>, origin: <#T##Address?#>, destination: <#T##Address?#>, carrier: <#T##Carrier?#>, items: <#T##[ShipmentItem]#>, rate: <#T##Decimal?#>, cost: <#T##Decimal?#>)
    }
    
    #endif
    
}
