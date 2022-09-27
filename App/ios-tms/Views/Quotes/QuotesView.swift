//
//  QuotesView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct QuotesView: View {
    
    @EnvironmentObject var quoteStore: QuoteStore
    
    @State var navigateToCreateView = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(quoteStore.quotes) { quote in
                        NavigationLink(destination: QuoteDetailsView(quote: quote)) {
                            QuoteRowView(quote: quote)
                        }
                    }
                }
                .navigationBarItems(trailing: Button(action: {
                        navigateToCreateView = true
                    }) {
                        Image(systemName: "plus")
                    })
                NavigationLink("Navigator",
                               destination: CreateQuoteView(),
                               isActive: $navigateToCreateView)
            }

            

        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
            QuotesView()
                .environmentObject(QuoteStore.example)
            .previewInterfaceOrientation(.portrait)

    }
}
