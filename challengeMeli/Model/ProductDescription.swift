//
//  ProductDetail.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation

struct ProductDescription: Codable {
    let plainText: String

    enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
    }
}
