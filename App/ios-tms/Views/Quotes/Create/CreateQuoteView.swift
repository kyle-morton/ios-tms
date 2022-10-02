//
//  CreateQuoteView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/18/22.
//

import SwiftUI

struct CreateQuoteView: View {
    
    @EnvironmentObject var quoteStore: QuoteStore
    
    @State private var showingConfirmView = false;
    
    @State private var origin: String = ""
    @State private var destination: String = ""
    @State private var units: Int? = 0
    @State private var weightInPounds: Decimal? = 0
    @State private var pickupDate = Date()
    
    var disableForm: Bool {
        origin.count < 5
        || destination.count < 5
        || units == 0
        || weightInPounds == 0
    }
    
    func submitQuote() async {
        print("Submitting Quote...")
        do {
            var newQuote = QuoteCreateViewModel(origin: origin, destination: destination, items: units ?? 0, weight: weightInPounds ?? 0, pickupDate: pickupDate)
            var createdQuote = try await  quoteStore.createQuote(quote: newQuote)
        } catch {
    
        }
    }
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Origin")) {
                DatePicker(
                    "Pickup Date",
                    selection: $pickupDate,
                    displayedComponents: [.date])
                TextField("Location", text: $origin)
            }
            Section(header: Text("Destination")) {
                TextField("Location", text: $destination)
            }
            Section(header: Text("Items")) {
                TextField("Pallet Count", value: $units, format: .number)
            }
            Section(header: Text("Weight")) {
                TextField("Weight In Pounds", value: $weightInPounds, format: .number)
            }
            Button(action: {
                Task {
                    await submitQuote()
                }
            }, label: {
                Text("Submit")
            })
            .disabled(disableForm)
        }
    }
    
}

struct CreateQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateQuoteView()
            .environmentObject(QuoteStore.example)
        
    }
}

