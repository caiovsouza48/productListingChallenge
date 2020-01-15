//
//  MoreInfoDataPresentationController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

struct MoreInfoDataPresentationController {
   
    static func replacedValueDescription(value: String, withRegex regex: String) -> String{
        let trimmedValue = value.replacingOccurrences(of: regex, with: "", options: .regularExpression)
        return trimmedValue
    }

}
