//
//  StopsRepository.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Combine
import Foundation

protocol ProductsRepositoryProtocol {
    func getProducts(query: String, offset: Int, limit: Int) -> AnyPublisher<SearchResult, Error>
    func getProductPictures(productId: String) -> AnyPublisher<ProductPictures, Error>
    func getProductDescription(productId: String) -> AnyPublisher<ProductDescription, Error>
}

class ProductsRepository: ProductsRepositoryProtocol {
    
    @Inject var stopsRemoteDataSource: ProductsRemoteDataSourceProtocol
    
    
    func getProducts(query: String, offset: Int, limit: Int) -> AnyPublisher<SearchResult, Error> {
        return Future<SearchResult, Error> { promise in
            self.stopsRemoteDataSource.getProducts(query: query, offset: offset, limit: limit) { result in
                switch result {
                case .success(let remoteData):                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + 10) {
                        promise(.success(remoteData))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func getProductPictures(productId: String) -> AnyPublisher<ProductPictures, Error> {
        return Future<ProductPictures, Error> { promise in
            self.stopsRemoteDataSource.getProductPictures(productId: productId) { result in
                switch result {
                case .success(let remoteData):
                    promise(.success(remoteData))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    func getProductDescription(productId: String) -> AnyPublisher<ProductDescription, Error> {
        return Future<ProductDescription, Error> { promise in
            self.stopsRemoteDataSource.getProductDescription(productId: productId) { result in
                switch result {
                case .success(let remoteData):
                    promise(.success(remoteData))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
