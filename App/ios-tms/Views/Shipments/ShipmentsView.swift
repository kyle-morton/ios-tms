//
//  ShipmentsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentsView: View {
    
    @StateObject var shipmentsVm = ShipmentListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shipmentsVm.items) { shipment in
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
    }
}
