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
    @StateObject var quoteStore = QuoteStore()
    @StateObject var carrierStore = CarrierStore()
    
    @State private var errorWrapper: TMSError?;
    @State private var isLoadingStartingData = true;
    
    var body: some Scene {
        WindowGroup {
//            LoadingView(isShowing: $isLoadingStartingData) {
                CentralView()
                    .task {
                        do {
                            carrierStore.carriers = try await carrierStore.load()
                            shipmentStore.shipments = try await shipmentStore.load()
                            shipmentStore.openShipmentCount = try await shipmentStore.getOpenShipmentCount()
//                            try await Task.sleep(nanoseconds: 1_000_000_000) // sleep 1 sec
                        }
                        catch {
                            errorWrapper = TMSError(error: error, guidance: "Try again later.")
                        }

                        isLoadingStartingData = false
                    }
                    .environmentObject(shipmentStore)
                    .environmentObject(carrierStore)
//            }

        }
    }
}
