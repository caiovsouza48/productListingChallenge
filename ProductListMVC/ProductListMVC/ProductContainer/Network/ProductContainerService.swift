//
//  ProductContainerService.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

protocol ProductContainerServiceProvider {
    func requestProductList(completionHandler: @escaping (Result<Response, NetworkError>) -> Void)
}

public class ProductContainerService: ProductContainerServiceProvider {
    
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    func requestProductList(completionHandler: @escaping (Result<Response, NetworkError>) -> Void) {
        
        let endpoint: ProductListEndpoint = .requestProductList
        
        networkProvider.request(endpoint) { (result: Result<Response, NetworkError>) in
            completionHandler(result.mapError { $0 })
        }
    }
    
}

