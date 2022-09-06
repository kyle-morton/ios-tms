//
//  TMSError.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/5/22.
//

import Foundation

struct TMSError : Identifiable {
    let id: UUID;
    let error: Error;
    let guidance: String;
    
    internal init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
