//
//  HomeMiddleware.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Combine
import Foundation

let productsMiddleware: Middleware<AppState, AppAction> = { state, action in
    
    @Inject var stopRepository: ProductsRepositoryProtocol
    
    var middlewareCancellables: Set<AnyCancellable> = []
    switch action {
    case .requestFetchProducts:
        guard state.searchResultState.thereAreMorePages,
              !state.searchResultState.isLoading
        else {
            return Empty().eraseToAnyPublisher()
        }

        let loadingAction = AppAction.fetchingProductsStarted
        let fetchAction = AppAction.fetchProducts
        return Publishers.Merge(Just(loadingAction), Just(fetchAction)).eraseToAnyPublisher()

        
    case .retryRequetFechProducts:
        let loadingAction = AppAction.fetchingProductsStarted
        let fetchAction = AppAction.fetchProducts
        return Publishers.Merge(Just(loadingAction),Just(fetchAction)).eraseToAnyPublisher()
        
    case .fetchProducts:
        let publisher = stopRepository.getProducts(
                 query: state.searchState.query,
                 offset: state.searchResultState.currentOffset,
                 limit: state.searchResultState.limit
             )
             .map { searchResult in
                 AppAction.fetchProductsSuccess(searchResult)
             }
             .catch { error in
                 Just(AppAction.fetchProductsFailure(error.localizedDescription))
             }
             .eraseToAnyPublisher()
        
        let cancellable = publisher.sink(receiveValue: { _ in })
        middlewareCancellables.insert(cancellable)
        return publisher

    case .cancelFetchProducts:
        if !state.homeRouteStack.contains(where: {
            if case .searchResult = $0 { return true }
            return false
        }) {
            middlewareCancellables.forEach { $0.cancel() }
            middlewareCancellables.removeAll()
        }

    
    default:
            break
    }
    
    return Empty().eraseToAnyPublisher()
}

