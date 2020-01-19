//
//  Seeds.swift
//  UIComponentsTests
//
//  Created by Caio de Souza on 19/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common

/// Generated data for UIComponents Unit Tests
struct Seeds {
    
    // MARK: - Product
    struct Product {
        static let testProduct = TestProduct()
    }
    
    // MARK: - DataSource
    struct ProductDataSource {
        static let dataSource: [ProductFacade] = [Product.testProduct, Product.testProduct]
    }
}
