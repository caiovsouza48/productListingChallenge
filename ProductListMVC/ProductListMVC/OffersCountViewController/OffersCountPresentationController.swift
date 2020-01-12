//
//  OffersCountPresentationController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

/// This struct do the presentation Logic of the OffersCountViewController
struct OffersCountPresentationController {
    
    // MARK: Variables
    var offersCount: Int
    
    // MARK: - Functions
    
    func formattedOffersCount() -> String {
        return "\(offersCount) ofertas"
    }

}
