//
//  ProductContainerControllerTEsts.swift
//  ProductListMVCTests
//
//  Created by Caio de Souza on 19/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import XCTest
import Networking
@testable import ProductListMVC

class ProductContainerControllerTests: XCTestCase {
    
    // MARK: - Subject to Test
    
    var subject: ProductContainerController!
    
    // MARK: - Test Doibles

    enum TestType {
        case success
        case failure
    }

    class MockedService: ProductContainerServiceProvider {
        
        var response: Response?
        var testType: TestType = .success
        
        func requestProductList(completionHandler: @escaping (Result<Response, NetworkError>) -> Void) {
            switch testType {
            case .success:
                completionHandler(.success(response!))
            case .failure:
                completionHandler(.failure(NetworkError.statusCode(response!)))
            }
        }
    }
    
    func makeProductContainerController(with response: Response,
                                        testType: TestType = .success) -> ProductContainerController {
            let mockService = MockedService()
            mockService.response = response
            mockService.testType = testType
            let productContainerController = ProductContainerController(productContainerService: mockService)
            return productContainerController
    }
    
    // MARK: - Setup
    
    func testRequestSuccess() {
        // Given
        let httpResponse = HTTPURLResponse(url: URL(fileURLWithPath: "/test"),
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: [:])
        let response = Response(statusCode: 200, data: Seeds.ProductApiRespone.responseData, response: httpResponse)
        subject = makeProductContainerController(with: response, testType: .success)
        let requestExpectation = self.expectation(description: "Expect Request to be sucessfull")
        
        // When
        subject.fetchProducts { (result) in
            switch result {
            case .success:
                requestExpectation.fulfill()
            case .failure:
                 XCTFail("Request should Be Sucessfull")
            }
        }
        
        // Then
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testRequestFail() {
        // Given
        subject = makeProductContainerController(with: Response(statusCode: 500,
                                                                 data: Data()),
                                                                 testType: .failure)
        var receivedError: ProductListError?

        // When
        subject.fetchProducts { (result) in
            switch result {
            case .success:
                XCTFail("Request should Be Fail")
            case .failure(let error):
                receivedError = error
            }
        }
        // Then
        XCTAssertEqual(receivedError, ProductListError.requestFail)
     }
}

extension ProductListError: Equatable {
    
    public static func == (lhs: ProductListError, rhs: ProductListError) -> Bool {
        switch (lhs, rhs) {
        case (.requestFail, .requestFail):
            return true
        case (.decodeError(let lhsError), .decodeError(let rhsError)):
            return lhsError.code == rhsError.code
        default:
            return false
        }
    }
}
