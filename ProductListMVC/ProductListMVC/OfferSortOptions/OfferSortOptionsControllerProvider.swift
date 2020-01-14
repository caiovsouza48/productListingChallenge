//
//  OfferSortOptionsControllerProvider.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

/// Defines a Contract of what a Offer Sort should provide to be implemented as a Controller
protocol OfferSortOptionsControllerProvider {
    var sortOptions: [String] { get set }
    
    
}
