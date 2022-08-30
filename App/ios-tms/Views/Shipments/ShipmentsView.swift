//
//  ShipmentsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentsView: View {
    
    @EnvironmentObject var shipmentsVM: ShipmentListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shipmentsVM.shipments) { shipment in
                    Section(header: Text("Shipment \(shipment.id.formatted())")) {
                        
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
            .environmentObject(ShipmentListViewModel.example)
    }
}
