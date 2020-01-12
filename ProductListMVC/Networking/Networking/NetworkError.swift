//
//  APIRequestError.swift
//  Networking
//
//  Created by Caio Sanchez Santos Costa on 17/07/19.
//  Copyright © 2019 Beblue. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case encodableMapping(Error)
    case parameterEncoding(Error)
    case missingURL
    case underlying(Error, Response?)
    case noResult
    case statusCode(Response)
    case imageMapping(Response)
    case jsonMapping(Response)
    case objectMapping(Error, Response)
}
