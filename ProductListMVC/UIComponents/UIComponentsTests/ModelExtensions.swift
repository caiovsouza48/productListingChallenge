//
//  ModelExtensions.swift
//  UIComponentsTests
//
//  Created by Caio de Souza on 19/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common

struct TestProduct: ProductFacade {
    var displayName: String { return "testName"}
    
    var displayDescription: String? { return "testDescription"}
    
    var displayPreviusPrice: Double { return 1999.0 }
    
    var displayCurrentPrice: Double { return 999.0}
    
    var displayInstallment: String { return "12x"}
    
    var displayImageURL: String { return "http://lorempixel.com/300/200"}
    
    var displayRating: Double { return 4.5 }
    
}
