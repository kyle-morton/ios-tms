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
    
    var body: some Scene {
        WindowGroup {
            CentralView()

        }
    }
}
