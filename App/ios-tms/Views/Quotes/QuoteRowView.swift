//
//  QuoteRowView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/13/22.
//

import SwiftUI

struct QuoteRowView: View {
    let quote: QuoteIndexItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "doc.plaintext")
                    .font(.subheadline)
                Text("Quote \(quote.id)")
                    .fontWeight(.bold)
                    .font(.headline)
            }
            HStack {
//                Image(systemName: "mappin")
                Text("\(quote.origin)")
                    .font(.caption)
                Text(" > ")
                    .font(.caption)
                Text("\(quote.destination)")
                    .font(.caption)
            }
            HStack {
                Text("\(quote.items) pallets, \(quote.weightFormatted)lbs")
                    .font(.caption)
            }
            HStack {
                Text("$\(quote.lowestRateFormatted) - $\(quote.highestRateFormatted)")
                    .font(.subheadline)
            }
        }
    }
}

    struct QuoteRowView_Previews: PreviewProvider {
        static var previews: some View {
            QuoteRowView(quote: QuoteStore.example.quotes[0])
        }
    }
