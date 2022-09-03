//
//  CreateShipmentView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CreateShipmentView: View {
    
    @State private var showingSubmittingShipmentAlert = false;
    
    var body: some View {
        Form {
//                VStack {
//
//                }
            Button("Submit") {
                showingSubmittingShipmentAlert.toggle()
            }
        }
        .alert(isPresented: $showingSubmittingShipmentAlert) {
            Alert(title: Text("Shipment confirmed"), message: Text("Your total was () – thank you!"), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("New Shipment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShipmentView()
    }
}
