//
//  LoadingView.swift
//  ios-tms
//
//  Created by Kyle Morton on 9/6/22.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool  // should the modal be visible?
    var content: () -> Content
    var text: String?  // the text to display under the ProgressView - defaults to "Loading..."

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                // the content to display - if the modal is showing, we'll blur it
                content()
                    .disabled(isShowing)
                    .blur(radius: isShowing ? 2 : 0)
                
                // all contents inside here will only be shown when isShowing is true
                if isShowing {
                    // this Rectangle is a semi-transparent black overlay
                    Rectangle()
                        .fill(Color.black).opacity(isShowing ? 0.4 : 0)
                        .edgesIgnoringSafeArea(.all)

                    // the magic bit - our ProgressView just displays an activity
                    // indicator, with some text underneath showing what we are doing
                    VStack(spacing: 48) {
                        ProgressView().scaleEffect(2.0, anchor: .center)
                        Text(text ?? "Loading...")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 250, height: 200)
                    .background(Color.white)
//                    .foregroundColor(Color.primary)
                    .cornerRadius(16)
                }

            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true)) {
            Spacer()
        }
    }
}
