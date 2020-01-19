//
//  WhoSawAlsoEndpoint.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Networking

enum WhoSawAlsoEndpoint {
    case requestWhoSawAlsoProducts
}

extension WhoSawAlsoEndpoint: Endpoint {
    
    var baseURL: URL {
        return URL(string: "http://www.mocky.io")!
    }
    
    var path: String {
        return "/v2/5d1b50063400000f000006e7"
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
