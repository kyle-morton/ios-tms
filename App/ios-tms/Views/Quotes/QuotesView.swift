//
//  QuotesView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct QuotesView: View {
    
    @EnvironmentObject var quoteStore: QuoteStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quoteStore.quotes) { quote in
                    
                }
            }
            Text("Quotes...")
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
            .environmentObject(QuoteStore.example)
    }
}
