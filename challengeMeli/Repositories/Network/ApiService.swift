//
//  APIService.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//

import Foundation
import Alamofire

protocol ApiServiceProtocol {
    func request<Response: Decodable>(request: Request<Response>,
                 completion: @escaping (Result<Response, Error>) -> Void)
}

class ApiService: ApiServiceProtocol {
    
    func request<Response: Decodable>(request: Request<Response>,
                 completion: @escaping (Result<Response, Error>) -> Void) {
        AF.request(request.url,
                   method: request.method,
                   parameters: request.data,
               encoding: JSONEncoding.default,
               headers: [
                "Content-Type": "application/json",
                "Authorization": "Bearer APP_USR-6077452762930250-050423-66bc89358c7a667588bb76abfa3a3075__LD_LA__-139545719"
               ]
        )
        .validate()
        .responseDecodable(of: Response.self) {response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(self.handleAFError(response, error)))
            }
        }
    }
    
    func handleAFError<T>(_ response: AFDataResponse<T>, _ error: AFError) -> APIError {
        if let urlError = error.underlyingError as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                return .noInternet
            case .timedOut:
                return .timeout
            default:
                return .unknown(urlError)
            }
        }
        
        if case .responseSerializationFailed = error {
            return .parsingError
        }

        if let statusCode = response.response?.statusCode {
            let message = HTTPURLResponse.localizedString(forStatusCode: statusCode)
            return .serverError(statusCode, message)
        }
        
        return .unknown(error)
    }
}


enum APIError: Error, LocalizedError {
    case noInternet
    case timeout
    case parsingError
    case serverError(Int, String)
    case unknown(Error?)

    var errorDescription: String? {
        switch self {
        case .noInternet:
            return String.errorNoConnection
        case .timeout:
            return String.errorTimeout
        case .parsingError:
            return String.errorParsing
        case .serverError(let code, let message):
            return String(format: String.errorServer, code, message)
        case .unknown(let error):
            return error == nil ? nil : String(format: String.errorUnknownWithMessage, error!.localizedDescription)
        }
    }

    var localizedDescription: String {
        return errorDescription ?? String.errorUnknown
    }
}
