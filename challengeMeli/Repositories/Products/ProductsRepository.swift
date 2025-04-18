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
        return Future<SearchResult, Error> { [weak self] promise in
            guard let self = self else { return }
            self.stopsRemoteDataSource.getProducts(query: query, offset: offset, limit: limit) { result in
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
    
    func getProductPictures(productId: String) -> AnyPublisher<ProductPictures, Error> {
        return Future<ProductPictures, Error> { [weak self] promise in
            guard let self = self else { return }
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
        return Future<ProductDescription, Error> { [weak self] promise in
            guard let self = self else { return }
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
