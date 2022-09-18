//
//  ShipmentDetailsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentDetailsView: View {
    
    let shipment: ShipmentIndexItemViewModel
    
    var body: some View {
        
        VStack {
//            ProgressView(title: "Fetching Shipment Details")
            Text("BOL: \(shipment.bol)")
        }
        .navigationTitle("BOL: \(shipment.bol)")
    }
}

struct ShipmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentDetailsView(shipment: ShipmentStore.example.shipments[0])
    }
}
