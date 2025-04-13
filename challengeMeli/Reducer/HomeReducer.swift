//
//  HomeReducer.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import SwiftUICore

let homeReducer: Reducer<AppState, AppAction> = { state, action in
    switch action {    
        case .fetchingProductsStarted:
            state.searchResultState.isLoading = true
        
        case .fetchProductsSuccess(let searchResult):
            state.searchResultState.total = searchResult.paging.total
            state.searchResultState.currentOffset = searchResult.paging.offset + searchResult.paging.limit
            state.searchResultState.limit = searchResult.paging.limit
            if searchResult.paging.limit + searchResult.paging.offset > state.searchResultState.total {
                state.searchResultState.thereAreMorePages = false
            }
            state.searchResultState.isLoading = false
            state.searchResultState.products.append(contentsOf: searchResult.products.map { $0.toViewModel() })
            state.searchResultState.searchError = nil
            
        case .fetchProductsFailure(let error):
            state.searchResultState.isLoading = false
            state.searchResultState.searchError = error
        
        case .fetchProductDescriptionSuccess(let productDescription):
            state.searchResultState.productDetailState.isLoading = false
            state.searchResultState.productDetailState.productDescription = productDescription.toViewModel()
        
        case .fetchProductPicturesSuccess(let productPictures):
            state.searchResultState.productDetailState.productPictures = productPictures
            state.searchResultState.productDetailState.isLoading = false
        
        case .fetchProductDescription(_):
            state.searchResultState.productDetailState.isLoading = true
        
        case .fetchProductDescriptionFailure(let error):
            state.searchResultState.productDetailState.isLoading = false
            state.alertErrorMessage = error
        
        case .updateSearchText(let query):
            state.searchState.query = query
            state.searchState.isValidQuery = query.count >= 3
        default:
            break
    }
}
