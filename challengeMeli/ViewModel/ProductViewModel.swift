//
//  Untitled.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

struct ProductViewModel: Hashable {
    let id: String
    let title: String
    let price: String?
    let originalPrice: String?
    let thumbnail: String?
    let brand: String?

    init(product: Product) {
        self.id = product.id
        self.title = product.title
        self.price =  product.price != nil ? product.price?.formattedPrice() : String.priceNotFound
        self.originalPrice = product.originalPrice != nil ? product.originalPrice?.formattedPrice() : nil
        
        self.thumbnail = product.pictures.first?.url
        self.brand =  product.getAttributeValue(for: .brand)
    }
}
