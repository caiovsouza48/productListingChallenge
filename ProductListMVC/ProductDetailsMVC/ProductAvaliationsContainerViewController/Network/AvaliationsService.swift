//
//  AvaliationsService.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

protocol AvaliationsServiceProvider {
    func requestAvaliations(completionHandler: @escaping (Result<Response, NetworkError>) -> Void)
}

public class AvaliationsService: AvaliationsServiceProvider {
    
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    func requestAvaliations(completionHandler: @escaping (Result<Response, NetworkError>) -> Void) {
        
        let endpoint: AvaliationsEndpoint = .requestAvaliations
        
        networkProvider.request(endpoint) { (result: Result<Response, NetworkError>) in
            completionHandler(result.mapError { $0 })
        }
    }
    
}

