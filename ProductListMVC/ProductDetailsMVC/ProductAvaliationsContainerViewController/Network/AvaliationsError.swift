//
//  AvaliationsError.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

enum AvaliationsError: Error {
    case requestFail
    case decodeError(NSError)
}
