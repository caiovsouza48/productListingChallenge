//
//  ProductMeanAvaliationController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

struct ProductMeanPresentationController {
    let ratingValue: Double
    let avaliationsCount: Int
    
    func formattedRatingValue() -> String {
        return String(format: "%.1f", ratingValue)
    }
    
    func formattedAvaliationCount() -> String {
        return "\(avaliationsCount) avaliações"
    }
}
