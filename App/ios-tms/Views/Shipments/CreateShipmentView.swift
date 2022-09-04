//
//  CreateShipmentView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CreateShipmentView: View {
    
    @State private var showingSubmittingShipmentAlert = false;
    @State private var originCity: String = "";
    @State private var originState: String = "";
    @State private var originZipCode: String = "";
    @State private var destinationCity: String = "";
    @State private var destinationState: String = "";
    @State private var destinationZipCode: String = "";
    @State private var units: Int?;
    @State private var weightInPounds: Int?;
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = self.charges.reduce(0, +)
        return formatter.string(from: NSNumber(value: total)) ?? "$0"
    }
    
    var charges: [Double] {
        return [
            100,
            250,
            50
        ]
    }
    
    var body: some View {
        Form {
            Section(header: Text("Origin")) {
                TextField("City", text: $originCity)
                TextField("State", text: $originState)
                TextField("Zip Code", text: $originZipCode)
            }
            Section(header: Text("Destination")) {
                TextField("City", text: $destinationCity)
                TextField("State", text: $destinationState)
                TextField("Zip Code", text: $destinationZipCode)
            }
            Section(header: Text("Items")) {
                TextField("Units", value: $units, format: .number)
                TextField("Weight In Pounds", value: $weightInPounds, format: .number)
            }
            Section(header: Text("TOTAL: \(totalPrice)").font(.subheadline)) {
            }
            Button("Dispatch") {
                showingSubmittingShipmentAlert.toggle()
            }
        }
        .alert(isPresented: $showingSubmittingShipmentAlert) {
            Alert(title: Text("Shipment confirmed"), message: Text("Your total was () – thank you!"), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("New Shipment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShipmentView()
    }
}
