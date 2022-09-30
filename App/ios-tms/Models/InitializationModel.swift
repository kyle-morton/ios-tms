//
//  InitializationModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/29/22.
//

import Foundation

class InitializationModel : ObservableObject {
    @Published var isInitialized = false
    
    init(isInitialized: Bool) {
        self.isInitialized = isInitialized
    }
    
    init() {
        self.isInitialized = false
    }
}
