//
//  URL+Endpoint.swift
//  Networking
//
//  Created by José Victor Pereira Costa on 18/07/19.
//  Copyright © 2019 Beblue. All rights reserved.
//

import Foundation

extension URL {
    
    public init(endpoint: Endpoint) {
        if endpoint.path.isEmpty {
            self = endpoint.baseURL
        } else {
            self = endpoint.baseURL.appendingPathComponent(endpoint.path)
        }
    }
    
}
