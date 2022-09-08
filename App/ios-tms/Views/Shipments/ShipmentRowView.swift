//
//  ShipmentRowView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/30/22.
//

import SwiftUI

struct ShipmentRowView: View {
    let shipment: Shipment
    
    func formattedWeight() -> String {
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        
        return formatter.string(for: shipment.weight) ?? "0"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text("\(shipment.bol)")
                    .fontWeight(.bold)
                    .font(.headline)
                
                Image(systemName: "bus")
                    .font(.subheadline)
                Text("\(shipment.carrier)")
                    .font(.subheadline)
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
                Text("\(shipment.items) pallets, \(formattedWeight())lbs")
                    .font(.caption)
            }
            HStack {
//                Image(systemName: "banknote")
//                    .foregroundColor(shipment.isPaid ? .green : .red)
                Text("$\(shipment.rateFormatted)")
                    .font(.subheadline)
                    .foregroundColor(shipment.isPaid ? .green : .red)
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
