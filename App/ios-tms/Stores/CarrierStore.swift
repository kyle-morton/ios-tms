//
//  CarrierStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

class CarrierStore: ObservableObject {
    @Published var carriers: [Carrier] = [];
    
    func load() async throws -> [Carrier] {
        
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/carriers")
            else { fatalError("Missing URL") }
        
        print("url: \(url.absoluteURL)")
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
    
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching carriers"); }
        
//        print("response: \(data)");
        
        let decodedCarriers = try JSONDecoder().decode([Carrier].self, from: data);
//        print("Async decodedCarriers", decodedCarriers)

        return decodedCarriers
    }
    
    func loadMore() {
        // get more carriers from the server
    }
    
    init() {
        self.carriers = []
    }
    
    init(carriers: [Carrier]) {
        self.carriers = carriers
    }
    
    #if DEBUG
    
    static var example = CarrierStore(
        carriers: [
            Carrier(id: 1, name: "AAA Cooper", scac: "AACT"),
            Carrier(id: 2, name: "R&L Carriers", scac: "RLCA"),
            Carrier(id: 3, name: "Pitt Ohio", scac: "PITT"),
            Carrier(id: 4, name: "FedEx", scac: "FXFE")
        ]
    )
    
    #endif
    
}
