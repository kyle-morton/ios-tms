//
//  DateExtensions.swift
//  ios-tms
//
//  Created by Kyle Morton on 10/1/22.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
