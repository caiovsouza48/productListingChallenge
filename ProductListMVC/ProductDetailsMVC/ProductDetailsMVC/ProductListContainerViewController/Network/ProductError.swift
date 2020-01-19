//
//  ProductError.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

enum ProductError: Error {
    case requestFail
    case decodeError(NSError)
}
