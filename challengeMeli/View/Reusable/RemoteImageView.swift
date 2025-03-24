//
//  RemoteImageView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    let urlString: String?

    var body: some View {
        KFImage(urlString != nil ? URL(string: urlString!) : nil)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            .cornerRadius(8)
    }
}
