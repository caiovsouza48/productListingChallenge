//
//  Product.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - ProductAPIResponse
struct ProductAPIResponse: Codable {
    let produtos: [Produto]
    let quantidade: Int
}
