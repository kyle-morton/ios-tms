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
        Text("Rate: $\(rate.rateFormatted)")
    }
}

struct QuoteRateView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRateView(rate: QuoteStore.exampleDetails.rates[0])
    }
}
