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
    
    var body: some Scene {
        WindowGroup {
            CentralView()
                .environmentObject(shipmentStore)
                .environmentObject(carrierStore)
        }
    }
}
