//
//  Array+Duplicates.swift
//  Common
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

public extension Sequence {
    
    /// Filter Duplicates based on Property
    /// - Parameter includeElement: Element Property to the compared
    func filterDuplicates(includeElement: (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element] {
        var results = [Element]()

        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.isEmpty {
                results.append(element)
            }
        }

        return results
    }
}
