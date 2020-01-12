//
//  Formatter+.swift
//  Networking
//
//  Created by José Victor Pereira Costa on 29/07/19.
//  Copyright © 2019 Beblue. All rights reserved.
//

import Foundation

extension Formatter {
    
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
    
}
