//
//  CentralView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CentralView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    @EnvironmentObject var quoteStore: QuoteStore
    
    var body: some View {
        TabView {
            ShipmentsView()
                .tabItem({
                    Label("Shipments", systemImage: "bus")
                })
                .badge(
                    Text("\(shipmentStore.openShipmentCount)")
                )
            QuotesView()
                .tabItem({
                    Label("Quotes", systemImage: "dollarsign.circle")
//
                })
            DashboardView()
                .tabItem({
                    Label("Home", systemImage: "house")
                })

        }
    }
}

struct CentralView_Previews: PreviewProvider {
    static var previews: some View {
        CentralView()
            .environmentObject(ShipmentStore.example)
            .environmentObject(CarrierStore.example)
            .environmentObject(QuoteStore.example)
    }
}
