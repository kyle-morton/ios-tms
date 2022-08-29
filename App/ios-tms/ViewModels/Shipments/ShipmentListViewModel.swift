//
//  ShipmentListViewModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

class ShipmentListViewModel: ObservableObject {
    
    @Published var items = [ShipmentListItemViewModel]()

}
