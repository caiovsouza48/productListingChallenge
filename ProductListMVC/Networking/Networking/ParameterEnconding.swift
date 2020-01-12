//
//  ParameterEnconding.swift
//  Mars
//
//  Created by Caio Sanchez Santos Costa on 11/07/19.
//  Copyright © 2019 Caio Sanchez. All rights reserved.
//

import Foundation

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

/// A type used to define how a set of parameters are applied to a `URLRequest`.
public protocol ParameterEncoding {
    /// Creates a `URLRequest` by encoding parameters and applying them on the passed request.
    ///
    /// - Parameters:
    ///   - urlRequest: `URLRequest` value onto which parameters will be encoded.
    ///   - parameters: `Parameters` to encode onto the request.
    ///
    /// - Returns:      The encoded `URLRequest`.
    /// - Throws:       Any `Error` produced during parameter encoding.
    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest
}
