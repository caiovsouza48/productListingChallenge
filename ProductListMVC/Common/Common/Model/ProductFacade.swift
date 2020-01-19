//
//  ProductFacade.swift
//  Common
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

/// A Contract defining how a product will show some Data
public protocol ProductFacade: Codable {
    var displayName: String { get }
    var displayDescription: String? { get }
    var displayPreviusPrice: Double { get }
    var displayCurrentPrice: Double { get }
    var displayInstallment: String { get }
    var displayImageURL: String { get }
    var displayRating: Double { get }
    
}
