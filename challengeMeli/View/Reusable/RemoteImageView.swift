//
//  RemoteImageView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    let url: String?

    var body: some View {
        KFImage(url != nil ? URL(string: url!) : nil)
            .resizable()
            .placeholder { _ in
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .padding(24)
                    .foregroundStyle(AppColor.placehoderForeground.color)
                    .background(AppColor.placeholderBackground.color)
            }
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            .cornerRadius(8)
    }
}

#Preview {
    RemoteImageView(url: "")
}
