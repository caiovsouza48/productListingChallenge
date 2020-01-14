//
//  ProductContainerController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Networking

final class ProductContainerController {
    // MARK: - Properties

    let productContainerService: ProductContainerServiceProvider

    // MARK: - Initializers

    init(productContainerService: ProductContainerServiceProvider = ProductContainerService()) {
        self.productContainerService = productContainerService
    }

    // MARK: - Request Methods

    func fetchProducts(completion: @escaping(Result<ProductAPIResponse, ProductListError>) -> Void) {

        productContainerService.requestProductList() { [unowned self] result in
            switch result {
            case .success(let response):
                self.handleResponse(response, completion)
            case .failure:
                completion(.failure(.requestFail))
            }
        }
    }

    // MARK: - Handler Methods

    private func handleResponse(_ response: Response, _ completion: @escaping(Result<ProductAPIResponse, ProductListError>) -> Void) {
        do {
            let response = try response.filterSuccessfulStatusCodes()
            handleSuccess(response, completion: completion)
        } catch {
            handleError(response, completion: completion)
        }
    }

    private func handleSuccess(_ response: Response, completion: @escaping(Result<ProductAPIResponse, ProductListError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let productApiResponse = try decoder.decode(ProductAPIResponse.self, from: response.data)
            completion(.success(productApiResponse))
        } catch {
            print("Error in \(#function), \(error)")
            completion(.failure(.decodeError(.responseFormatError(code: response.statusCode))))
        }
    }

    private func handleError(_ response: Response, completion: @escaping(Result<ProductAPIResponse, ProductListError>) -> Void) {
        completion(.failure(.requestFail))
    }

}
