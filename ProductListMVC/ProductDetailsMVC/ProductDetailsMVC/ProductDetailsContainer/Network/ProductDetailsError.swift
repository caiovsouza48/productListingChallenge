//
//  ProductDetailsError.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

enum ProductDetailsError: Error {
    case requestFail
    case decodeError(NSError)
}
