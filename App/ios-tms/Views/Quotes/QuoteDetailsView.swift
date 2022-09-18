//
//  QuoteDetailsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/30/22.
//

import SwiftUI

struct QuoteDetailsView: View {
    let quote: Quote
    
    var body: some View {
        Text("Quote: \(quote.id)")
    }
}

struct QuoteDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailsView(quote: QuoteStore.example.quotes[0])
    }
}
