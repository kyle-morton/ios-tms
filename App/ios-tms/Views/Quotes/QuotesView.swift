//
//  QuotesView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct QuotesView: View {
    
    @EnvironmentObject var quoteStore: QuoteStore
    
    @State var showingCreateView = false;
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quoteStore.quotes) { quote in
                    NavigationLink(destination: QuoteDetailsView(quote: quote)) {
                        QuoteRowView(quote: quote)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                    showingCreateView = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingCreateView) {
                    NavigationView {
                        CreateQuoteView()
                        .navigationTitle("Create Quote")
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
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
            .environmentObject(QuoteStore.example)
    }
}
