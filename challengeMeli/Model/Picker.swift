//
//  Picker.swift
//  challengeMeli
//
//  Created by Pablo Poza on 12/04/2025.
//

import Foundation

struct Picker: Codable {
    let pickerID, pickerName: String
    let products: [PickerProduct]?
    let attributes: [Attribute]?
    let valueNameDelimiter: String?

    enum CodingKeys: String, CodingKey {
        case pickerID = "picker_id"
        case pickerName = "picker_name"
        case products, attributes
        case valueNameDelimiter = "value_name_delimiter"
    }
}


struct PickerProduct: Codable {
    let productID, pickerLabel, pictureID: String
    let thumbnail: String?
    let tags: [String]
    let permalink: String?
    let productName: String?
    let autoCompleted: Bool?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case pickerLabel = "picker_label"
        case pictureID = "picture_id"
        case thumbnail, tags, permalink
        case productName = "product_name"
        case autoCompleted = "auto_completed"
    }
}
