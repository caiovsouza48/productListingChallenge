//
//  ProductListError.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

enum ProductListError: Error {
    case requestFail
    case decodeError(NSError)
}
