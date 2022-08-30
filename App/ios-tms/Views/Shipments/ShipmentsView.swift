//
//  ShipmentsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentsView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shipmentStore.shipments) { shipment in
                    Section(header: Text("Shipment \(shipment.id)")) {
                        
                    }
                }
            }
        }
        .navigationTitle("Shipments")
        .listStyle(.grouped)
    }
}

struct ShipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentsView()
            .environmentObject(ShipmentStore.example)
    }
}
