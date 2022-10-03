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
    @State private var initializationModel = InitializationModel();
    
    var body: some Scene {
        WindowGroup {
//            LoadingView(isShowing: $isLoadingStartingData) {
                CentralView(initializationModel: initializationModel)
                    .task {
                        do {
                            carrierStore.carriers = try await carrierStore.load()
                            shipmentStore.shipments = try await shipmentStore.load()
                            shipmentStore.openShipmentCount = try await shipmentStore.getOpenShipmentCount()
                            quoteStore.quotes = try await quoteStore.load()
                        }
                        catch {
                            errorWrapper = TMSError(error: error, guidance: "Try again later.")
                        }

                        initializationModel.isInitialized = true
                    }
                    .environmentObject(shipmentStore)
                    .environmentObject(carrierStore)
                    .environmentObject(quoteStore)
                    .sheet(item: $errorWrapper, onDismiss: {
            //            store.scrums = DailyScrum.sampleData;
                        // do something here if you get an error?
                    }) { wrapper in
                        ErrorView(errorWrapper: wrapper)
                    };
//            }
        }
    }
}
