//
//  Request.swift
//  challengeMeli
//
//  Created by Pablo Poza on 22/03/2025.
//
import Alamofire

struct Constants {
    static let baseURL = "https://api.mercadolibre.com"
    static let site = "MLA"
    static let status = "active"
    static let offset = 10
}

struct Request<Response: Decodable> {
    let method: Alamofire.HTTPMethod
    let url: String
    let data: [String: Any]?
    let header: [String: Any]?
}


func getProductsRequest(query: String, offset: Int, limit: Int) -> Request<SearchResult> {
    return Request(
        method: .get, url: Constants.baseURL + "/products/search?search?status=\(Constants.status)&site_id=\(Constants.site)&q=\(query)&offset=\(offset)&limit=\(limit)", data: nil, header: nil
    )
}

func getProductPicturesRequest(productId: String) -> Request<ProductPictures> {
    return Request(
        method: .get, url: Constants.baseURL + "/items/\(productId)", data: nil, header: nil
    )
}

func getProductDescriptionRequest(productId: String) -> Request<ProductDescription> {
    return Request(
        method: .get, url: Constants.baseURL + "/products/\(productId)", data: nil, header: nil
    )
}
