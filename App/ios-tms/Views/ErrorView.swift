//
//  ErrorView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/5/22.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: TMSError;
    @Environment(\.dismiss) private var dismiss;
    
    var body: some View {
        NavigationView {
            VStack {
                Text("An error has occurred")
                    .font(.title)
                    .padding(.bottom);
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline);
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top);
                Spacer();
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss();
                    }
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: TMSError {
        TMSError(error: SampleError.errorRequired,
            guidance: "You can safely ignore this error.")
    }
    static var previews: some View {
        ErrorView(errorWrapper: wrapper);
    }
}
