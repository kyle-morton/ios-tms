//
//  StoreProtocol.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

protocol TmsStoreProctocol : ObservableObject {
    
    static func load() // get initial list from the server
    static func loadMore()  // get more from the server
    
}
