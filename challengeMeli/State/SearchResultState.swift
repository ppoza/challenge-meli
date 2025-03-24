//
//  HomeState.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

struct SearchResultState {
    var products: [ProductViewModel] = []
    var isLoading: Bool = false
    
    var query: String = ""
    
    var total = 0
    var currentOffset = 0
    var limit = Constants.offset
    
    var thereAreMorePages = true
        
    var searchError: String? = nil
    
    var productDetailState: ProductDetailState = ProductDetailState()
}
