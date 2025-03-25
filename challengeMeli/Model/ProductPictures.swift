//
//  ProductDetail.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation

struct ProductPictures: Codable {
    let pictures: [Picture]
}


struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}
