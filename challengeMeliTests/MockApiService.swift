//
//  MockApiService.swift
//  challengeMeli
//
//  Created by Pablo Poza on 24/03/2025.
//

import Combine
import Swinject
import Foundation
@testable import challengeMeli


final class MockAPIService: ApiServiceProtocol {
    var mockJSONResponses: [String: MockResponse] = [
        getProductDescriptionRequest(productId: "Not found").url : MockResponse(error: APIError.serverError(404, "Not Found") , json: nil)
    ]
    
    func request<Response: Decodable>(
        request: Request<Response>,
        completion: @escaping (Result<Response, Error>) -> Void
    ) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            
            let response = self.mockJSONResponses[request.url]!
            if let json = response.json {
                do {
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: json.data(using: .utf8)!)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            } else {
                if let error = response.error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.unknown(nil)))
                }
                
                completion(.failure(APIError.unknown(nil)))
            }
        }
    }
}

struct MockResponse {
    let error: APIError?
    let json: String?
}
