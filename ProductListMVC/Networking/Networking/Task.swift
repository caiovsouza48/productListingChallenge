//
//  Task.swift
//  Mars
//
//  Created by Caio Sanchez Santos Costa on 11/07/19.
//  Copyright © 2019 Caio Sanchez. All rights reserved.
//

import Foundation

/// Represents an HTTP task.
public enum Task {
    
    /// A request with no additional data.
    case requestPlain
    
    /// A request body set with `Encodable` type
    case requestJSONEncodable(Encodable)
    
    /// A requests body set with encoded parameters.
    case requestParameters(parameters: Parameters, parameterEnconding: ParameterEncoding)
    
    /// A file upload task.
    case uploadFile(URL)
    
    /// A file download task to a destination.
    case downloadDestination
}
