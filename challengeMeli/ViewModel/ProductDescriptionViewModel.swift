//
//  ProductDescriptionViewModel.swift
//  challengeMeli
//
//  Created by Pablo Poza on 12/04/2025.
//

struct ProductDescriptionViewModel {
    let description: String?
    let pictures: [PictureViewModel]?
    let pickers: [PickerViewModel]?
    let buyBoxWinner: BuyBoxWinnerViewModel?
    
    init(productDescription: ProductDescription) {
        self.description =  productDescription.shortDescription?.content
        self.pictures = productDescription.pictures?.map { PictureViewModel(picture: $0) }
        self.pickers = productDescription.pickers?.map { PickerViewModel(picker: $0) }
        if let buyBoxWinner = productDescription.buyBoxWinner {
            self.buyBoxWinner = BuyBoxWinnerViewModel(buyBoxWinner: buyBoxWinner)
        } else {
            self.buyBoxWinner = nil
        }
    }
}

struct PictureViewModel {
    let id: String
    let url: String

    init(picture: Picture) {
        self.id = picture.id
        self.url = picture.url
    }
}
