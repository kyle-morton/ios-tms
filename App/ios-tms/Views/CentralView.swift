//
//  CentralView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CentralView: View {
    
    @StateObject var initializationModel: InitializationModel
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    @EnvironmentObject var quoteStore: QuoteStore
    
    var body: some View {
        
        if initializationModel.isInitialized {
            TabView {
                DashboardView()
                    .tabItem({
                        Label("Home", systemImage: "house")
                    })
                QuotesView()
                    .tabItem({
                        Label("Quotes", systemImage: "dollarsign.circle")
                    })
                ShipmentsView()
                    .tabItem({
                        Label("Shipments", systemImage: "bus")
                    })
            }
        }
        else {
            VStack {
                Text("Loading...")
            }
        }
    }
}

struct CentralView_Previews: PreviewProvider {
    static var previews: some View {
        CentralView(initializationModel: InitializationModel(isInitialized: true))
            .environmentObject(ShipmentStore.example)
            .environmentObject(CarrierStore.example)
            .environmentObject(QuoteStore.example)
    }
}
