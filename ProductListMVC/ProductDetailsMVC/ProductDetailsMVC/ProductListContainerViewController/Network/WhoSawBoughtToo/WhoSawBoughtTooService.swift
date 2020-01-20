//
//  ProductListService.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

public class WhoSawBoughtTooService: ProductListServiceProvider {
    
    private let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    public func requestProducts(completionHandler: @escaping (Result<Response, NetworkError>) -> Void) {
        
        let endpoint: WhoSawBoughtTooEndpoint = .requestWhoSeeBuyedProducts
        
        networkProvider.request(endpoint) { (result: Result<Response, NetworkError>) in
            completionHandler(result.mapError { $0 })
        }
    }
    
}
