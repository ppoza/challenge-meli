//
//  ProductsDataSource.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

protocol ProductsRemoteDataSourceProtocol {
    func getProducts(query: String, offset: Int, limit: Int, completion: @escaping (Result<SearchResult, any Error>) -> Void)
    func getProductDescription(productId: String, completion: @escaping (Result<ProductDescription, any Error>) -> Void)
    func getProductPictures(productId: String, completion: @escaping (Result<ProductPictures, any Error>) -> Void)
}

class ProductsRemoteDataSource: ProductsRemoteDataSourceProtocol {
    
    @Inject var apiService: ApiServiceProtocol
    
    func getProducts(query: String, offset: Int, limit: Int, completion: @escaping (Result<SearchResult, any Error>) -> Void) {
        apiService.request(request: getProductsRequest(query: query, offset: offset, limit: limit)) { result in
            switch result {
                case .success(let responseData):
                completion(.success(responseData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProductPictures(productId: String, completion: @escaping (Result<ProductPictures, any Error>) -> Void) {
        apiService.request(request: getProductPicturesRequest(productId: productId)) { result in
            switch result {
            case .success(let responseData):
                completion(.success(responseData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProductDescription(productId: String, completion: @escaping (Result<ProductDescription, any Error>) -> Void) {
        apiService.request(request: getProductDescriptionRequest(productId: productId)) { result in
            switch result {
            case .success(let responseData):
                completion(.success(responseData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
