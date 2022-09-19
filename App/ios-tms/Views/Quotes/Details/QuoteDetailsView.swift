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
    
    var body: some View {
        VStack{
            if quoteDetails.id > 0 {
                List {
                    ForEach(quoteDetails.rates) { rate in
                        QuoteRateView(rate: rate)
                    }
                }
            }
        }
        .navigationTitle("Quote: \(quote.id)")
        .task {
            do {
                quoteDetails = try await QuoteStore.getDetails(id: quote.id)
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
