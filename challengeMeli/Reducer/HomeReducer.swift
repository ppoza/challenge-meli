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
            if searchResult.paging.limit + searchResult.paging.offset >= state.searchResultState.total {
                state.searchResultState.thereAreMorePages = false
            }
            state.searchResultState.products.append(contentsOf: searchResult.products.map { $0.toViewModel() })
            state.searchResultState.isLoading = false
            state.searchResultState.searchError = nil
            
        case .fetchProductsFailure(let error):
            state.searchResultState.isLoading = false
            state.searchResultState.searchError = error
        
        case .fetchProductDescriptionSuccess(let productDescription):
            state.searchResultState.productDetailState.productDescription = productDescription
        case .fetchProductPicturesSuccess(let productPictures):
            state.searchResultState.productDetailState.productPictures = productPictures
            
        case .updateSearchText(let query):
            state.searchState.query = query
            state.searchState.isValidQuery = query.count >= 3
        default:
            break
    }
}


func navigationReduce(_ state: inout AppState, _ action: NavigationAction) -> Void {
    switch action {
        case .navigateTo(let route):
            state.homeRouteStack.append(route)
            switch route {
                case .productDetail(let product):
                state.searchResultState.productDetailState = ProductDetailState(product: product)
                case .searchResult:
                state.searchResultState = SearchResultState(query: state.searchState.query)
                default:
                break
            }
        case .goBack:
            _ = state.homeRouteStack.popLast()
        case .updateNavigationPath(let newPath):
            state.homeRouteStack = newPath
    }
}
