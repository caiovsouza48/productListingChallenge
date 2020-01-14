//
//  ProductDetailsContainerController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Networking

final class ProductDetailsContainerController {
    // MARK: - Properties

    let productDetailsService: ProductDetailsServiceProvider

    // MARK: - Initializers

    init(productDetailsService: ProductDetailsServiceProvider = ProductDetailsService()) {
        self.productDetailsService = productDetailsService
    }

    // MARK: - Request Methods

    func fetchProductDetails(completion: @escaping(Result<ProductDetails, ProductDetailsError>) -> Void) {

        productDetailsService.requestProductDetails { [unowned self] result in
            switch result {
            case .success(let response):
                self.handleResponse(response, completion)
            case .failure:
                completion(.failure(.requestFail))
            }
        }
    }

    // MARK: - Handler Methods

    private func handleResponse(_ response: Response, _ completion: @escaping(Result<ProductDetails, ProductDetailsError>) -> Void) {
        do {
            let response = try response.filterSuccessfulStatusCodes()
            handleSuccess(response, completion: completion)
        } catch {
            handleError(response, completion: completion)
        }
    }

    private func handleSuccess(_ response: Response, completion: @escaping(Result<ProductDetails, ProductDetailsError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let productApiResponse = try decoder.decode(ProductDetails.self, from: response.data)
            completion(.success(productApiResponse))
        } catch {
            print("Error in \(#function), \(error)")
            completion(.failure(.decodeError(.responseFormatError(code: response.statusCode))))
        }
    }

    private func handleError(_ response: Response, completion: @escaping(Result<ProductDetails, ProductDetailsError>) -> Void) {
        completion(.failure(.requestFail))
    }
    
}
