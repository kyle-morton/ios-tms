//
//  Carrier.swift
//  ios-tms
//
//  Created by Kyle Morton on 8/28/22.
//

import Foundation

struct Carrier: Codable, Identifiable {
    var id: Int
    var name: String
    var scac: String
}
