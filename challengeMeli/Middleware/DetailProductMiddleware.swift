//
//  DetailProductMiddleware.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Combine

let productDetailMiddleware: Middleware<AppState, AppAction> = { state, action in
    
    @Inject var productsRepository: ProductsRepositoryProtocol
    
    switch action {
    case  .fetchProductDescription:
        return productsRepository.getProductDescription(productId: state.searchResultState.productDetailState.product!.id)
                    .map { description in
                        return .fetchProductDescriptionSuccess(description)
                    }
                    .catch { error in
                        return Just(.fetchProductsFailure(error.localizedDescription))
                    }
                    .eraseToAnyPublisher()
    case .fetchProductPictures:
        return productsRepository.getProductPictures(productId: state.searchResultState.productDetailState.product!.id)
                    .map { pictures in
                        return .fetchProductPicturesSuccess(pictures)
                    }
                    .catch { error in
                        return Just(.fetchProductsFailure(error.localizedDescription))
                    }
                    .eraseToAnyPublisher()
    default:
    break
    }
    return Empty().eraseToAnyPublisher()
        
}

