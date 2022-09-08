//
//  ShipmentStore.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/29/22.
//

import Foundation

// Store == Service

class ShipmentStore: ObservableObject {
    @Published var shipments: [Shipment] = [];
    
    func load() async throws -> [Shipment] {
        
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/shipments/all")
            else { fatalError("Missing URL") }
        
        print("url: \(url.absoluteURL)")
        
        let urlRequest = URLRequest(url: url);
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
    
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while fetching shipments"); }
        
        print("response: \(data)");
        
        do {
            let json = try JSONDecoder().decode([Shipment].self, from: data)
            print(json)
        } catch {
            print("JSON error: \(error)")
        }
        
        let decodedShipments = try JSONDecoder().decode([Shipment].self, from: data);
        print("Async decodedShipments", decodedShipments)

        return decodedShipments
    }
    
    static func loadMore() {
        // get more shipments from the server
    }
    
    func createShipment(shipment: Shipment) async throws -> Shipment {
        guard let url = URL(string:"\(ConfigurationHelper.apiBaseUrl)/shipments/create")
            else { fatalError("Missing URL") }
        
        print("url: \(url.absoluteURL)")
        
        let jsonData = try JSONEncoder().encode(shipment)
        
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200
            else { fatalError("Error while creating shipment"); }
        
        print("response: \(data)");
        
        let decodedShipment = try JSONDecoder().decode(Shipment.self, from: data);
        print("Async decodedShipment", decodedShipment)

        return decodedShipment
    }
    
    init() {
        self.shipments = []
    }
    
    init(shipments: [Shipment]) {
        self.shipments = shipments
    }
    
    #if DEBUG
    
    static var example = ShipmentStore(
        shipments: [
            Shipment(id: 1, bol: "601001",  origin: "Memphis, TN", destination: "Little Rock, AR", carrier: "AACT", items: 5, weight: 10000, rate: 255, isPaid: true),
            Shipment(id: 2, bol: "601002", origin: "Memphis, TN", destination: "Austin, TX", carrier: "PYLE", items: 2, weight: 2000, rate: 500, isPaid: false),
            Shipment(id: 3, bol: "601003", origin: "Kansas City, MO", destination: "Brooklyn, NY", carrier: "RLCA", items: 5, weight: 10000, rate: 2400, isPaid: false),
        ]
    )
    
    #endif
    
}
