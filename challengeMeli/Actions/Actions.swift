//
//  Actions.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

enum AppAction {
    case clearError
    case showError(String)

    case navigation(NavigationAction)
    
    // Search
    case updateSearchText(String)
    
    // Result
    case cancelFetchProducts
    case retryRequetFechProducts
    case requestFetchProducts
    case fetchProducts
    case fetchingProductsStarted
    case fetchProductsSuccess(SearchResult)
    case fetchProductsFailure(String)
    
    // Product Detail
    case fetchProductDescription
    case fetchProductPictures
    case fetchProductDescriptionSuccess(ProductDescription)
    case fetchProductPicturesSuccess(ProductPictures)
}


enum NavigationAction {
    case navigateTo(Route)
    case goBack
    case updateNavigationPath([Route])
}


enum Route: Hashable {
    case searchProducts
    case searchResult(query: String)
    case productDetail(ProductViewModel)
}
