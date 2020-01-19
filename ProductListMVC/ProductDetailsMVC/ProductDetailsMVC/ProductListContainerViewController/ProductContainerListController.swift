//
//  ProductContainerListController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking
import Common

final class ProductContainerListController {
    // MARK: - Properties

    let productService: ProductListServiceProvider

    // MARK: - Initializers

    init(productService: ProductListServiceProvider) {
        self.productService = productService
    }

    // MARK: - Request Methods

    func fetchProducts(completion: @escaping(Result<GenericProductAPIResponse, ProductError>) -> Void) {

        productService.requestProducts { [unowned self] result in
            switch result {
            case .success(let response):
                self.handleResponse(response, completion)
            case .failure:
                completion(.failure(.requestFail))
            }
        }
    }

    // MARK: - Handler Methods

    private func handleResponse( _ response: Response, _ completion: @escaping(Result<GenericProductAPIResponse, ProductError>) -> Void) {
        do {
            let response = try response.filterSuccessfulStatusCodes()
            handleSuccess(response, completion: completion)
        } catch {
            handleError(response, completion: completion)
        }
    }

    private func handleSuccess(_ response: Response, completion: @escaping(Result<GenericProductAPIResponse, ProductError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(GenericProductAPIResponse.self, from: response.data)
            completion(.success(apiResponse))
        } catch {
            print("Error in \(#function), \(error)")
            completion(.failure(.decodeError(.responseFormatError(code: response.statusCode))))
        }
    }

    private func handleError(_ response: Response, completion: @escaping(Result<GenericProductAPIResponse, ProductError>) -> Void) {
        completion(.failure(.requestFail))
    }
    
}
