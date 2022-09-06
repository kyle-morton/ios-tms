//
//  ios_tmsApp.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

@main
struct ios_tmsApp: App {
    
    @StateObject var shipmentStore = ShipmentStore()
    @StateObject var carrierStore = CarrierStore()
    
    @State private var errorWrapper: TMSError?;
    
    var body: some Scene {
        WindowGroup {
            
            CentralView()
                .task {
                    do {
                        carrierStore.carriers = try await carrierStore.load();
                    }
                    catch {
                        errorWrapper = TMSError(error: error, guidance: "Try again later.");
                    }
                }
                .environmentObject(shipmentStore)
                .environmentObject(carrierStore)
        }
    }
}
