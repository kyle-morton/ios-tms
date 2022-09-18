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
                Image(systemName: "bus.fill")
                    .font(.subheadline)
                Text("\(shipment.bol)")
                    .fontWeight(.bold)
                    .font(.headline)
            }
            HStack {
//                Image(systemName: "mappin")
                Text("\(shipment.origin)")
                    .font(.caption)
                Text(" > ")
                    .font(.caption)
                Text("\(shipment.destination)")
                    .font(.caption)
            }
            HStack {
                Text("\(shipment.items) pallets, \(shipment.weightFormatted)lbs")
                    .font(.caption)
            }
            HStack {
                Text("\(shipment.carrier)")
                    .font(.subheadline)
                Text("$\(shipment.rateFormatted)")
                    .font(.subheadline)
                    .foregroundColor(shipment.isPaid ? .green : .red)
            }

        }
        
    }
}

struct ShipmentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentRowView(shipment: ShipmentStore.example.shipments[0])
    }
}
