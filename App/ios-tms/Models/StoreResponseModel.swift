//
//  StoreResponseModel.swift
//  ios-tms
//
//  Created by Kyle Morton on 10/2/22.
//

import Foundation

struct StoreResponseModel {
    var objectId: Int?
    var isSuccess: Bool
    var message: String?

    internal init(objectId: Int? = nil, message: String? = nil, isSuccess: Bool) {
        self.objectId = objectId
        self.isSuccess = isSuccess
        self.message = message
    }
    
}
