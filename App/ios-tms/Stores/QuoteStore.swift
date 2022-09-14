//
//  QuoteStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

class QuoteStore: ObservableObject {
    @Published var quotes: [Quote] = [];
    @Published var quoteCount: Int = 0;
    
    init() {
        self.quotes = []
    }
    
    init(quotes: [Quote], quoteCount: Int) {
        self.quotes = quotes
        self.quoteCount = quoteCount
    }
    
    #if DEBUG

    static var example = QuoteStore(
        quotes: [
            Quote(id: 1, origin: "Memphis, TN", destination: "Little Rock, AR", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", rateCount: 5),
            Quote(id: 2, origin: "Memphis, TN", destination: "Austin, TX", items: 2, weight: 2000, lowestRate: 400, lowestRateFormatted: "400.00", highestRate: 877.24, highestRateFormatted: "877.24", rateCount: 5),
            Quote(id: 3, origin: "Kansas City, MO", destination: "Brooklyn, NY", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", rateCount: 5),
        ],
        quoteCount: 3
    )

    #endif

}
