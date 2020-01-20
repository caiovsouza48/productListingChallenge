//
//  ProductPricePresentation.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import UIKit

/// Contorls the presentation Logi for Price
struct ProductPricePresentation {
    let previousPrice: Double
    let currentPrice: Double
    let maxInstallment: Int
    let installmentPrice: Double
    let discountPercentage: Int
    
    func attributtedStrikethroughPreviousPrice() -> NSAttributedString {
        let formattedPreviousPrice = String.localizedStringWithFormat("R$ %.2f", previousPrice)
        let attributtedString = NSMutableAttributedString(string: formattedPreviousPrice)
        attributtedString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                       value: NSUnderlineStyle.single.rawValue,
                                       range: NSRange(location: 0, length: attributtedString.length))
        return attributtedString
    }
    
    func currentPriceString() -> String {
        return "R$ \(String.localizedStringWithFormat("%.2f", currentPrice))"
    }
    
    func installmentTextString() -> String {
        return "\(maxInstallment)x de R$  \(String.localizedStringWithFormat("%.2f", installmentPrice))"
    }
    
    func discountPercentageString() -> String {
        return "-\(discountPercentage)%"
    }
    
    func isDiscountPercentageHidden() -> Bool {
        return discountPercentage <= 0
    }
}
