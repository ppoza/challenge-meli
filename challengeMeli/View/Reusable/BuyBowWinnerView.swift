//
//  BuyBowWinnerView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 13/04/2025.
//

import SwiftUI

struct BuyBoxWinnerView: View {
    let buyBoxWinner: BuyBoxWinnerViewModel
    
    var body: some View {
        VStack {
            Text(.titleBuyBoxWinner).font(.title2)
            HStack(spacing: 8) {
                Text(buyBoxWinner.price)
                    .font(.title)
                    .foregroundColor(.blue)
                    .bold()
                
                if let originalPrice = buyBoxWinner.originalPrice {
                    Text(originalPrice)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.placeholderBackground)
        .overlay(
            Rectangle()
                .stroke(.placehoderForeground, lineWidth: 1)
        )
    }
}

#Preview {
    BuyBoxWinnerView(
        buyBoxWinner: BuyBoxWinnerViewModel(originalPrice: "123121", price: "34534354")
    )
}
