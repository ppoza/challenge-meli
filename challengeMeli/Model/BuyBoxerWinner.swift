//
//  BuyBoxerWinner.swift
//  challengeMeli
//
//  Created by Pablo Poza on 12/04/2025.
import Foundation


struct BuyBoxWinner: Codable {
    let itemID, categoryID: String
    let sellerID: Int
    let price: Double?
    let currencyID: String
    let warranty, condition: String
    let listingTypeID: String
    let acceptsMercadopago: Bool
    let originalPrice: Double?
    let internationalDeliveryMode: String
    let tags: [String]
    let tier, inventoryID, productID, siteID: String

    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case categoryID = "category_id"
        case sellerID = "seller_id"
        case price
        case currencyID = "currency_id"
        case warranty, condition
        case originalPrice = "original_price"
        case listingTypeID = "listing_type_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case internationalDeliveryMode = "international_delivery_mode"
        case tags
        case tier
        case inventoryID = "inventory_id"
        case productID = "product_id"
        case siteID = "site_id"
    }
}


