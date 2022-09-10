//
//  CreateShipmentView.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import SwiftUI

struct CreateShipmentView: View {
    
    @EnvironmentObject var shipmentStore: ShipmentStore
    @EnvironmentObject var carrierStore: CarrierStore
    
//    @State private var showingGetShipmentRateAlert = false
    @State private var showingConfirmView = false;
    
    @State private var origin: String = "";
//    @State private var originState: String = "";
//    @State private var originZipCode: String = "";
    @State private var destination: String = "";
//    @State private var destinationState: String = "";
//    @State private var destinationZipCode: String = "";
    @State private var selectedCarrier: Int?;
    @State private var units: Int?;
    @State private var weightInPounds: Int?;
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = self.charges.reduce(0, +)
        return formatter.string(from: NSNumber(value: total)) ?? "$0"
    }
    
    var charges: [Double] {
        return [
            100,
            250,
            50
        ]
    }
    
    func validateShipment() -> Bool {
        // todo - add validation
        return true;
    }
    
    var body: some View {
        Form {
            Section(header: Text("Origin")) {
                TextField("Location", text: $origin)
//                TextField("State", text: $originState)
//                TextField("Zip Code", text: $originZipCode)
            }
            Section(header: Text("Destination")) {
                TextField("Location", text: $destination)
//                TextField("State", text: $destinationState)
//                TextField("Zip Code", text: $destinationZipCode)
            }
            Section(header: Text("Items")) {
                TextField("Units", value: $units, format: .number)
                TextField("Weight In Pounds", value: $weightInPounds, format: .number)
            }
//            Section(header: Text("Carrier")) {
//                Picker("Selected Carrier", selection: $selectedCarrier) {
//                    ForEach(carrierStore.carriers) {
//                        Text("\($0.name) - \($0.scac)")
//                    }
//                }
//            }

            Button("Get Rate") {
//                showingConfirmView.toggle()
                if (!validateShipment()) {
                    // display error
                }

                var shipmentToCreate = Shipment(origin: origin, destination: destination)

                Task{
                    do {
                        shipmentToCreate = try await shipmentStore.createShipment(shipment: shipmentToCreate)
                        shipmentStore.shipments = try await shipmentStore.load()
                    }catch {
                        print("error: \(error)")
                    }

                }

                // go to confirm screen
            }
        }
        .navigationTitle("New Shipment")
        .navigationBarTitleDisplayMode(.inline)
//        .sheet(isPresented: $showingConfirmView) {
//            NavigationView {
//                ConfirmShipmentView()
////                            .navigationTitle(scrum.title)
//                    .toolbar {
//                        ToolbarItem(placement: .cancellationAction) {
//                                Button("Cancel") {
//                                    showingConfirmView = false;
//                                }
//                        };
//                        ToolbarItem(placement: .confirmationAction) {
//                            Button("Confirm") {
//                                showingConfirmView = false;
////                                        scrum.update(from: data);
//                            }
//                        }
//                    };
//            }
//
//        };
    }
}

struct CreateShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShipmentView()
            .environmentObject(ShipmentStore.example)
            .environmentObject(CarrierStore.example)
    }
}
