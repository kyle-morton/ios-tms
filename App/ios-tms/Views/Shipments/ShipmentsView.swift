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
    
    var body: some View {
            List {
                ForEach(shipmentStore.shipments) { shipment in
                    NavigationLink(destination: ShipmentDetailsView(shipment: shipment)) {
                        ShipmentRowView(shipment: shipment)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                //
                print("Clicked nav button...")
                showingCreateView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingCreateView) {
                NavigationView {
                    CreateShipmentView()
                        .navigationTitle("Create Shipment")
    //                            .navigationTitle(scrum.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        showingCreateView = false;
                                    }
                            };
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Confirm") {
                                    showingCreateView = false;
    //                                        scrum.update(from: data);
                                }
                            }
                        };
                }
    
            };
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    NavigationLink(destination: CreateShipmentView()) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.blue)
//                    }
//                }
//            }
    }
}

struct ShipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShipmentsView()
                .environmentObject(ShipmentStore.example)
                .environmentObject(CarrierStore.example)
        }
    }
}
