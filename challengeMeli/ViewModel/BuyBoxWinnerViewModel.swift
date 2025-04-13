//
//  BuyBoxWinnerViewModel.swift
//  challengeMeli
//
//  Created by Pablo Poza on 12/04/2025.
//

struct BuyBoxWinnerViewModel: Codable {
    
    let originalPrice: String?
    let price: String
    
    init(buyBoxWinner: BuyBoxWinner) {
        self.price =  buyBoxWinner.price?.formattedPrice() ?? String.priceNotFound
        self.originalPrice = buyBoxWinner.originalPrice != nil ? buyBoxWinner.originalPrice?.formattedPrice() : nil
    }
    
    init(originalPrice: String?, price: String) {
        self.price = price
        self.originalPrice = originalPrice
    }
}


