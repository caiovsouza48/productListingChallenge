//
//  AvaliationsContainerController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

final class AvaliationsContainerController {
    // MARK: - Properties

    let avaliationsService: AvaliationsServiceProvider

    // MARK: - Initializers

    init(avaliationsService: AvaliationsServiceProvider = AvaliationsService()) {
        self.avaliationsService = avaliationsService
    }

    // MARK: - Request Methods

    func fetchAvaliations(completion: @escaping(Result<AvaliationsAPIResponse, AvaliationsError>) -> Void) {

        avaliationsService.requestAvaliations { [unowned self] result in
            switch result {
            case .success(let response):
                self.handleResponse(response, completion)
            case .failure:
                completion(.failure(.requestFail))
            }
        }
    }

    // MARK: - Handler Methods

    private func handleResponse(_ response: Response, _ completion: @escaping(Result<AvaliationsAPIResponse, AvaliationsError>) -> Void) {
        do {
            let response = try response.filterSuccessfulStatusCodes()
            handleSuccess(response, completion: completion)
        } catch {
            handleError(response, completion: completion)
        }
    }

    private func handleSuccess(_ response: Response, completion: @escaping(Result<AvaliationsAPIResponse, AvaliationsError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            let avaliationsApiResponse = try decoder.decode(AvaliationsAPIResponse.self, from: response.data)
            completion(.success(avaliationsApiResponse))
        } catch {
            print("Error in \(#function), \(error)")
            completion(.failure(.decodeError(.responseFormatError(code: response.statusCode))))
        }
    }

    private func handleError(_ response: Response, completion: @escaping(Result<AvaliationsAPIResponse, AvaliationsError>) -> Void) {
        completion(.failure(.requestFail))
    }
    
}

