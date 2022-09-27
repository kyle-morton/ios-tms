//
//  CreateQuoteView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/18/22.
//

import SwiftUI

struct CreateQuoteView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    
    @State private var showingConfirmView = false;
    
    @State private var origin: String = "";
    @State private var destination: String = "";
    @State private var selectedCarrier: Int?;
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
    
    func validateQuote() -> Bool {
        // todo - add validation
        return true;
    }
    
    func submitQuote() {
        print("Submitting Quote...")
    }
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Origin")) {
                TextField("Location", text: $origin)
            }
            Section(header: Text("Destination")) {
                TextField("Location", text: $destination)
            }
            Section(header: Text("Items")) {
                TextField("Units", value: $units, format: .number)
                TextField("Weight In Pounds", value: $weightInPounds, format: .number)
            }
            Button(action:submitQuote) {
                Text("Submit")
            }
//            .navigationTitle("New Quote")
//            .navigationBarTitleDisplayMode(.inline)

        }
    }
    
}

struct CreateQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateQuoteView()
            .environmentObject(QuoteStore.example)
    }
}

