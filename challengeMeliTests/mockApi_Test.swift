//
//  mockApi_Test.swift
//  challengeMeli
//
//  Created by Pablo Poza on 24/03/2025.
//

import XCTest
import Testing
@testable import challengeMeli


import Combine
import Swinject

class MockApiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Container.shared = testContainer
    }
    
    @Inject var productRepository: ProductsRepositoryProtocol
    func testNotFoundProductDescription() {
        let expectation = expectation(description: "Fetch product detail from Mock API")
        var cancellables: Set<AnyCancellable> = []
      
        productRepository.getProductDescription(productId: "Not found")
          .sink(receiveCompletion: { completion in
              if case .failure(let error) = completion {
                  guard case let APIError.serverError(code, _) = error else {
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
