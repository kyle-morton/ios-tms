//
//  CentralView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CentralView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem({
                    Label("Home", systemImage: "house")
                })
            ShipmentsView()
                .tabItem({
                    Label("Shipments", systemImage: "bus")
                })
            QuotesView()
                .tabItem({
                    Label("Quotes", systemImage: "dollarsign.circle")
                })
        }
    }
}

struct CentralView_Previews: PreviewProvider {
    static var previews: some View {
        CentralView()
            .environmentObject(ShipmentStore.example)
    }
}
