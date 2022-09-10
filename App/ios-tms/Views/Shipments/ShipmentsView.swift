//
//  ShipmentsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentsView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    
    @State var isLoadingShipments = true
    
    var body: some View {
            List {
                ForEach(shipmentStore.shipments) { shipment in
                    NavigationLink(destination: ShipmentDetailsView(shipment: shipment)) {
                        ShipmentRowView(shipment: shipment)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: CreateShipmentView()) {
                        Image(systemName: "plus")
                    }
                }
            }
    }
}

struct ShipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShipmentsView()
                .environmentObject(ShipmentStore.example)
                .environmentObject(CarrierStore.example)
        }
    }
}
