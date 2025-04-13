//
//  ProductDetail.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation

struct ProductDescription: Codable {
    let shortDescription: ShorDescription?
    let pictures: [Picture]?
    let pickers: [Picker]?
    let buyBoxWinner: BuyBoxWinner?
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case pictures
        case pickers
        case buyBoxWinner = "buy_box_winner"
    }
}

struct ShorDescription: Codable {
    let content: String?
}


extension ProductDescription {
    func toViewModel() -> ProductDescriptionViewModel {
        return ProductDescriptionViewModel(productDescription: self)
    }
}
