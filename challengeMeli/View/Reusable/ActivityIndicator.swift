//
//  Loading.swift
//  challengeMeli
//
//  Created by Pablo Poza on 13/04/2025.
//

import SwiftUI

struct ActivityIndicatorView: View {

    var body: some View {        
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(AppColor.placeholderBackground.color.opacity(0.4))
    }
}

#Preview {
    ActivityIndicatorView()
}
