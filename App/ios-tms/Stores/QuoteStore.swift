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
    
    func getDetails(id: Int) async throws -> QuoteDetailsViewModel {

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
    
    func createQuote(quote: QuoteCreateViewModel) async throws -> Int {
        
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/quotes/create")
            else { fatalError("Missing URL")}
        
        let payload = try JSONEncoder().encode(quote)
        let jsonString = String(data: payload,
                                encoding: .utf8)
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        print("request: \(jsonString)");
        print("url: \(url)");

        let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: payload)
        
        let httpResponse = response as? HTTPURLResponse
        
        let dataStr = String(data: data, encoding: String.Encoding.utf8)
        
        print("response: \(dataStr), response: \(httpResponse)");
        
        guard httpResponse?.statusCode == 200 else { fatalError("Error while create quote") }
        
        let newQuoteId = try JSONDecoder().decode(Int.self, from: data)
        
        return newQuoteId
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
            QuoteIndexItemViewModel(id: 1, origin: "Memphis, TN", destination: "Little Rock, AR", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", pickupDateFormatted: "9/25/22", rateCount: 5),
            QuoteIndexItemViewModel(id: 2, origin: "Memphis, TN", destination: "Austin, TX", items: 2, weight: 2000, lowestRate: 400, lowestRateFormatted: "400.00", highestRate: 877.24, highestRateFormatted: "877.24", pickupDateFormatted: "9/10/22", rateCount: 5),
            QuoteIndexItemViewModel(id: 3, origin: "Kansas City, MO", destination: "Brooklyn, NY", items: 5, weight: 10000, lowestRate: 255, lowestRateFormatted: "255.00", highestRate: 1200, highestRateFormatted: "1200.00", pickupDateFormatted: "9/17/22", rateCount: 5),
        ],
        quoteCount: 3
    )
    
    static var exampleDetails = QuoteDetailsViewModel(id: 1, origin: "Memphis, TN", destination: "Little Rock, AR", items: 5, weight: 10000, pickupDateFormatted: "9/25/22",
        rates: [
            QuoteRateViewModel(id: 1, quoteId: 1, carrier: "AAA Cooper", rate: 125.45, rateFormatted: "125.45", cost: 100.99, costFormatted: "100.99", pickupDateFormatted: "9/25/22", estDeliveryDateFormatted: "10/1/22"),
            QuoteRateViewModel(id: 2, quoteId: 1, carrier: "FedEx", rate: 500.32, rateFormatted: "500.32", cost: 400.00, costFormatted: "400.00", pickupDateFormatted: "9/26/22", estDeliveryDateFormatted: "9/30/22"),
            QuoteRateViewModel(id: 3, quoteId: 1, carrier: "R&L Carriers", rate: 99.45, rateFormatted: "99.45", cost: 99.45, costFormatted: "100.99", pickupDateFormatted: "9/25/22", estDeliveryDateFormatted: "9/29/22"),
            QuoteRateViewModel(id: 4, quoteId: 1, carrier: "Pitt Ohio", rate: 410.99, rateFormatted: "410.99", cost: 410.00, costFormatted: "100.99", pickupDateFormatted: "9/27/22", estDeliveryDateFormatted: "9/27/22"),
            QuoteRateViewModel(id: 5, quoteId: 1, carrier: "AAA Cooper", rate: 232.04, rateFormatted: "232.04", cost: 100.99, costFormatted: "100.99", pickupDateFormatted: "9/28/22", estDeliveryDateFormatted: "10/1/22"),
        ]
    )
    
    #endif

}
