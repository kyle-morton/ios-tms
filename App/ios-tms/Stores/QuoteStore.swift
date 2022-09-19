//
//  QuoteStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

class QuoteStore: ObservableObject {
    @Published var quotes: [QuoteIndexItemViewModel]
    @Published var quoteCount: Int = 0;
    
    func load() async throws -> [QuoteIndexItemViewModel] {
        
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/quotes/all")
            else { fatalError("Missing URL") }
        
        print("url: \(url.absoluteURL)")
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
    
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching quotes"); }
        
        print("response: \(data)");

        let decodedQuotes = try JSONDecoder().decode([QuoteIndexItemViewModel].self, from: data);
        print("Async decodedQuotes", decodedQuotes)

        return decodedQuotes
    }
    
    static func getDetails(id: Int) async throws -> QuoteDetailsViewModel {

        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/quotes/details?quoteId=\(id)")
            else { fatalError("Missing URL") }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url));
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching quotes"); }
        
        print("response: \(data)");
        
        let decodedQuote = try JSONDecoder().decode(QuoteDetailsViewModel.self, from: data);
        print("Async decodedQuote", decodedQuote)

        return decodedQuote
    }
    
    init() {
        self.quotes = []
    }
    
    init(quotes: [QuoteIndexItemViewModel], quoteCount: Int) {
        self.quotes = quotes
        self.quoteCount = quoteCount
    }
    
    #if DEBUG

    static var example = QuoteStore(
        quotes: [
            QuoteIndexItemViewModel(id: 1, origin: "Memphis, TN", destination: "Little Rock, AR", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", rateCount: 5),
            QuoteIndexItemViewModel(id: 2, origin: "Memphis, TN", destination: "Austin, TX", items: 2, weight: 2000, lowestRate: 400, lowestRateFormatted: "400.00", highestRate: 877.24, highestRateFormatted: "877.24", rateCount: 5),
            QuoteIndexItemViewModel(id: 3, origin: "Kansas City, MO", destination: "Brooklyn, NY", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", rateCount: 5),
        ],
        quoteCount: 3
    )
    
    static var exampleDetails = QuoteDetailsViewModel(id: 1, origin: "Memphis, TN", destination: "Little Rock, AR", items: 5, weight: 10000, rates: [
            QuoteRateViewModel(id: 1, quoteId: 1, carrier: "AAA Cooper", rate: 125.45, rateFormatted: "125.45", cost: 100.99, costFormatted: "100.99"),
            QuoteRateViewModel(id: 2, quoteId: 1, carrier: "FedEx", rate: 500.32, rateFormatted: "500.32", cost: 400.00, costFormatted: "400.00"),
            QuoteRateViewModel(id: 3, quoteId: 1, carrier: "R&L Carriers", rate: 125.45, rateFormatted: "125.45", cost: 100.99, costFormatted: "100.99"),
            QuoteRateViewModel(id: 4, quoteId: 1, carrier: "Pitt Ohio", rate: 125.45, rateFormatted: "125.45", cost: 100.99, costFormatted: "100.99"),
            QuoteRateViewModel(id: 5, quoteId: 1, carrier: "AAA Cooper", rate: 125.45, rateFormatted: "125.45", cost: 100.99, costFormatted: "100.99"),
        ]
    )
    
    #endif

}
