//
//  NSError+.swift
//  Networking
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

public extension NSError {
    
    class func error(_ title: String, _ description: String) -> NSError {
        return NSError.error(code: -1, title: title, description: description)
    }
    
    class func error(code: NSInteger, title:String, description: String) -> NSError {
        return NSError.init(domain: title, code: code, userInfo: [NSLocalizedDescriptionKey : description])
    }

    class func responseFormatError(code: Int) -> NSError {
        return NSError.error(code: code, title: "Error", description: "Corpo da resposta de erro sem os campos esperados.")
    }
}
