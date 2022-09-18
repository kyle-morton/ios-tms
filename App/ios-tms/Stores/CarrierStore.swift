//
//  CarrierStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

class CarrierStore: ObservableObject {
    @Published var carriers: [CarrierOption] = [];
    
    func load() async throws -> [CarrierOption] {
        
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/carriers")
            else { fatalError("Missing URL") }
        
        print("url: \(url.absoluteURL)")
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
    
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching carriers"); }
        
//        print("response: \(data)");
        
        let decodedCarriers = try JSONDecoder().decode([CarrierOption].self, from: data);
//        print("Async decodedCarriers", decodedCarriers)

        return decodedCarriers
    }
    
    func loadMore() {
        // get more carriers from the server
    }
    
    init() {
        self.carriers = []
    }
    
    init(carriers: [CarrierOption]) {
        self.carriers = carriers
    }
    
    #if DEBUG
    
    static var example = CarrierStore(
        carriers: [
            CarrierOption(id: 1, name: "AAA Cooper", scac: "AACT"),
            CarrierOption(id: 2, name: "R&L Carriers", scac: "RLCA"),
            CarrierOption(id: 3, name: "Pitt Ohio", scac: "PITT"),
            CarrierOption(id: 4, name: "FedEx", scac: "FXFE")
        ]
    )
    
    #endif
    
}
