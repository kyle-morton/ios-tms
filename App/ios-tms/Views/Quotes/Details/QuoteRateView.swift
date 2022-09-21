//
//  QuoteRateView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/19/22.
//

import SwiftUI

struct QuoteRateView: View {
    
    let rate: QuoteRateViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(rate.carrier)
                    .font(.headline)
                Spacer()
                Text("$\(rate.rateFormatted)")
                    .font(.subheadline)
            }
            HStack {
                Text("Pickup: \(rate.pickupDateFormatted)")
                    .font(.caption)
                Spacer()
                Text("Est. Delivery: \(rate.estDeliveryDateFormatted)")
                    .font(.caption)
            }
        }
    }
}

struct QuoteRateView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRateView(rate: QuoteStore.exampleDetails.rates[0])
    }
}
