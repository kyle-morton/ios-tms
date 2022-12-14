//
//  ShipmentsView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct ShipmentsView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    
    @State var isLoadingShipments = true
    @State var showingCreateView = false;
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(shipmentStore.shipments) { shipment in
                    NavigationLink(destination: ShipmentDetailsView(shipment: shipment) ) {
                        ShipmentRowView(shipment: shipment)
                    }
                    .isDetailLink(false)
                }
            }
            .searchable(text: $searchText)
            .navigationBarItems(trailing: Button(action: {
                    showingCreateView = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingCreateView) {
                    NavigationView {
                        CreateShipmentView()
                        .navigationTitle("Create Shipment")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        showingCreateView = false;
                                    }
                            };
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Create") {
                                    showingCreateView = false;
                                }
                            }
                        };
                    }
        
                }
            }
        }

}

struct ShipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentsView()
            .environmentObject(ShipmentStore.example)
            .environmentObject(CarrierStore.example)
    }
}
