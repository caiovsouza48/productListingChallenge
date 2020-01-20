//
//  ProductDetailsService.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Networking

protocol ProductDetailsServiceProvider {
    func requestProductDetails(completionHandler: @escaping (Result<Response, NetworkError>) -> Void)
}

public class ProductDetailsService: ProductDetailsServiceProvider {
    
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    func requestProductDetails(completionHandler: @escaping (Result<Response, NetworkError>) -> Void) {
        
        let endpoint: ProductDetailsEndpoint = .requestProductDetails
        
        networkProvider.request(endpoint) { (result: Result<Response, NetworkError>) in
            completionHandler(result.mapError { $0 })
        }
    }
    
}
