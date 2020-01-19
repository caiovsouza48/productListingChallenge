//
//  Sequence+KeyPath.swift
//  Common
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

/// Type erasing wrapper in order to erase the value type of a key path, while ensuring that it is Comparable
public struct PartialComparableKeyPath<Root> {

    private let _isEqual: (Root, Root) -> Bool
    private let _isLessThan: (Root, Root) -> Bool

    public init<Value : Comparable>(_ keyPath: KeyPath<Root, Value>) {
        self._isEqual = { $0[keyPath: keyPath] == $1[keyPath: keyPath] }
        self._isLessThan = { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }

    func isEqual(_ lhs: Root, _ rhs: Root) -> Bool {
        return _isEqual(lhs, rhs)
    }

    func isLessThan(_ lhs: Root, _ rhs: Root) -> Bool {
        return _isLessThan(lhs, rhs)
    }
}

// MARK: - Sequence sorted by KeyPath

extension Sequence {

    public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { firstElement, secondElement in
            return firstElement[keyPath: keyPath] < secondElement[keyPath: keyPath]
        }
    }

    public func sorted(by keyPaths: PartialComparableKeyPath<Element>...) -> [Element] {
        return sorted { lhs, rhs in
            for keyPath in keyPaths {
                if !keyPath.isEqual(lhs, rhs) {
                    return keyPath.isLessThan(lhs, rhs)
                }
            }
            return false
        }
    }
}

// MARK: - Reference Sort by keyPath
extension MutableCollection where Self: RandomAccessCollection {
    @inlinable public mutating func sort<T: Comparable>(keyPath: KeyPath<Element, T>) {
        sort(by: { (firstElement, secondElement) -> Bool in
            return firstElement[keyPath: keyPath] < secondElement[keyPath: keyPath]
        })
    }
}
