//
//  ShipmentRowView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/30/22.
//

import SwiftUI

struct ShipmentRowView: View {
    let shipment: Shipment
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(shipment.bol)")
                    .fontWeight(.bold)
                    .font(.headline)
                    
                Text("$\(shipment.rate.formatted())")
                    .font(.subheadline)
            }

            HStack {
                Text("\(shipment.origin)")
                    .font(.subheadline)
                Text(" > ")
                Text("\(shipment.destination)")
                    .font(.subheadline)
            }
        }
        .padding()
        
    }
}

struct ShipmentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentRowView(shipment: ShipmentStore.example.shipments[0])
    }
}
