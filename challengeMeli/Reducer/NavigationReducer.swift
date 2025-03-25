//
//  NavigationReducer.swift
//  challengeMeli
//
//  Created by Pablo Poza on 25/03/2025.
//

let navigationReducer: Reducer<AppState, NavigationAction> = { state, action in
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
