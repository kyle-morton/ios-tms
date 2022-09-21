//
//  QuoteDetailsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/30/22.
//

import SwiftUI

struct QuoteDetailsView: View {
    
    let quote: QuoteIndexItemViewModel
    @State var quoteDetails = QuoteDetailsViewModel()
    
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
                            QuoteRateView(rate: rate)
                        }
                        .onTapGesture {
                            
                        }
                    }
                }
                .listStyle(.inset)
            }
        }
        .navigationTitle("Quote: \(quote.id)")
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
    }
}

struct QuoteDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailsView(
            quote: QuoteStore.example.quotes[0],
            quoteDetails: QuoteStore.exampleDetails
        )
    }
}
