//
//  QuoteDetailsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/30/22.
//

import SwiftUI

struct QuoteDetailsView: View {
    
    let id: Int
    @State var quoteDetails = QuoteDetailsViewModel()
    @State var showingCreateView = false
    
    
    func sortedRates() -> [QuoteRateViewModel] {
        return quoteDetails.rates
    }
    
    var body: some View {
        VStack{
            if quoteDetails.id > 0 {
                HStack {
                    Image(systemName: "calendar.badge.clock")
                    Text("Pickup: \(quoteDetails.pickupDateFormatted)")
                    Spacer()
                }.padding()
                List {
                    Section(header: Text("Rates")) {
                        ForEach(sortedRates()) { rate in
                            HStack {
                                QuoteRateView(rate: rate)
                                Button(action: {
                                    showingCreateView.toggle()
                                }){
                                    Image(systemName: "plus.app")
                                        .font(.body)
                                }
                            }
 
                        }
                    }
                }
                .listStyle(.inset)
            }
        }
        .navigationTitle("Quote: \(id)")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                #if DEBUG
                    quoteDetails = QuoteStore.exampleDetails
                #else
                    quoteDetails = try await QuoteStore.getDetails(id: quote.id)
                #endif
            }catch {
                print("Unable to pull details \(error)")
            }
        }
        .sheet(isPresented: $showingCreateView) {
            NavigationView {
                CreateShipmentFromQuoteView()
                .navigationTitle("Book Shipment")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showingCreateView = false;
                            }
                    };
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Create") {
                            showingCreateView = false;
                        }
                    }
                };
            }
        }
    }
}

struct QuoteDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailsView(
            id: 1,
            quoteDetails: QuoteStore.exampleDetails
        )
    }
}
