//
//  PickerViewModel.swift
//  challengeMeli
//
//  Created by Pablo Poza on 12/04/2025.
//

import Foundation

enum Tag: String {
    case selected = "selected"
}

struct PickerViewModel {
    let id, name: String
    let products: [PickerProductViewModel]?
    let selected: String?

    init(picker: Picker) {
        self.id = picker.pickerID
        self.name = picker.pickerName
        self.products = picker.products?.map { PickerProductViewModel(product: $0) }
        self.selected = self.products?.first { $0.isSelected }?.label
    }
}


struct PickerProductViewModel {
    let id, label: String
    let thumbnail: String?
    let tags: [String]
    let name: String?
    let isSelected: Bool

    init(product: PickerProduct) {
        self.id = product.productID
        self.name = product.productName
        self.label = product.pickerLabel
        self.thumbnail = product.thumbnail
        self.tags = product.tags
        self.isSelected = product.tags.contains(Tag.selected.rawValue)
    }
}

