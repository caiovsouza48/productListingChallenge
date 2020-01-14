//
//  ProductListEndpoint.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

enum ProductListEndpoint {
    case requestProductList
}

extension ProductListEndpoint: Endpoint {
    
    var baseURL: URL {
        return URL(string: "http://www.mocky.io")!
    }
    
    var path: String {
        return "/v2/5d1b4f0f34000074000006dd"
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

