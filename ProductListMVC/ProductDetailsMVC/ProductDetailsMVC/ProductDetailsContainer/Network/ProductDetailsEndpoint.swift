//
//  ProductDetailsEndpoint.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

enum ProductDetailsEndpoint {
    case requestProductDetails
}

extension ProductDetailsEndpoint: Endpoint {
    
    var baseURL: URL {
        return URL(string: "http://www.mocky.io")!
    }
    
    var path: String {
        return "/v2/5d1b4fd23400004c000006e1"
    }
    
    var method: Networking.Method {
        return .get
    }
    
    var headers: Headers? {
        return Headers().default
    }
    
    var task: Task {
        return .requestPlain
    }
    
}
