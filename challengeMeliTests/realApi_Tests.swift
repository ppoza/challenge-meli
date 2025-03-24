//
//  challenge_meliTests.swift
//  challengeMeliTests
//
//  Created by Pablo Poza on 22/03/2025.
//
import XCTest
import Testing
@testable import challengeMeli


import Combine
import Swinject

class RealApiTests: XCTestCase {
    
    
    @Inject var productRepository: ProductsRepositoryProtocol
    func testNotFoundProductDescription() {
        let expectation = expectation(description: "Fetch product detail from API")
        var cancellables: Set<AnyCancellable> = []
      
        productRepository.getProductDescription(productId: "MLA34321321")
          .sink(receiveCompletion: { completion in
              if case .failure(let error) = completion {
                  guard case let APIError.serverError(code, message) = error else {
                      XCTFail("No APIError")
                      expectation.fulfill()
                      return
                  }
                  XCTAssert(code == 404)
                  expectation.fulfill()
              }
          }, receiveValue: { todos in
              XCTFail("Product description found")
              expectation.fulfill()
          })
          .store(in: &cancellables)
      
      wait(for: [expectation], timeout: 5.0)
    }
    
}
