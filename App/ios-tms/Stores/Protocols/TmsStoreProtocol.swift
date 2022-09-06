//
//  StoreProtocol.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/4/22.
//

import Foundation

protocol TmsStoreProctocol : ObservableObject {
    
    static func load() async throws // get initial list from the server
    static func loadMore() async throws // get more from the server
    
}
