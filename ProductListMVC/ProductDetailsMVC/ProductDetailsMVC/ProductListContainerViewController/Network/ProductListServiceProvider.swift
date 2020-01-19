//
//  ProductListServiceProvider.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

/// Defines a service that can fetch Products
public protocol ProductListServiceProvider {
    func requestProducts(completionHandler: @escaping (Result<Response, NetworkError>) -> Void)
}
