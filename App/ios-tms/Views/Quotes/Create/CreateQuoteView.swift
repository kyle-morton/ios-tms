//
//  CreateQuoteView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/18/22.
//

import SwiftUI

struct CreateQuoteView: View {
    
    @EnvironmentObject var quoteStore: QuoteStore
    @State private var errorWrapper: TMSError?
    
//    @State private var showingConfirmView = false
    @State private var navigateToDetailsView = false
    
    @State private var origin: String = ""
    @State private var destination: String = ""
    @State private var units: Int? = 0
    @State private var weightInPounds: Decimal? = 0
    @State private var pickupDate = Date()
    @State private var newQuoteId: Int = 0
    
    @State private var originSearch = ""
    
    var disableForm: Bool {
        origin.count < 5
        || destination.count < 5
        || units == 0
        || weightInPounds == 0
    }
    
    func submitQuote() async {
        do {
            let newQuote = QuoteCreateViewModel(origin: origin, destination: destination, items: units ?? 0, weight: weightInPounds ?? 0, pickupDate: pickupDate)
            let createQuoteResponse = try await  quoteStore.createQuote(quote: newQuote)
            
            if (createQuoteResponse.isSuccess) {
                newQuoteId = createQuoteResponse.objectId!
                navigateToDetailsView = true
            }
            else {
                // display error here
            }
        } catch {
            errorWrapper = TMSError(error: error, guidance: "Try again later.")
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
//                    .searchable(text: $originSearch)
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
        
        .sheet(item: $errorWrapper, onDismiss: {
            // do something here if you get an error?
        }) { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
        
        NavigationLink(destination: QuoteDetailsView(id: newQuoteId),
                   isActive: $navigateToDetailsView) {
            EmptyView()
        }
       .isDetailLink(false)
    }
    
}

struct CreateQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateQuoteView()
            .environmentObject(QuoteStore.example)
        
    }
}

