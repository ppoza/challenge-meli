//
//  ErrorView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//
import SwiftUI

struct ErrorView: View {
    
    var error: String
    var retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(error)
            Button(action: {
                retryAction()
            }) {
                Text(LocalizedStringKey.retry)
            }.padding()
        }.padding()
    }
}

#Preview {
    ErrorView(error: "Error") {}
}
