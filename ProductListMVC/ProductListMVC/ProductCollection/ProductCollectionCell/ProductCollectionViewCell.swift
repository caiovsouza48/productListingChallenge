//
//  ProductCollectionViewCell.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common
import Cosmos


class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productDescription: UILabel!
    @IBOutlet var productRatingCosmosVieww: CosmosView!
    @IBOutlet var previousPriceLabel: UILabel!
    @IBOutlet var currentPriceLabel: UILabel!
    @IBOutlet var installmentPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let thickness: CGFloat = 1.0
        let borderColor = UIColor(red: 244.0/255.0, green: 242/255.0, blue: 240/255.0, alpha: 1.0).cgColor
        layer.addBorder(edge: .bottom, color: borderColor, thickness: thickness)
        layer.addBorder(edge: .left, color: borderColor, thickness: thickness)
        layer.addBorder(edge: .right, color: borderColor, thickness: thickness)
        layer.addBorder(edge: .top, color: borderColor, thickness: thickness)
    }
    
    
    func configure(withDescription productDescriptionString: String?,
                   rating: Double,
                   previousPrice: Double,
                   currentPrice: Double,
                   maxInstallment: Int,
                   installmentPrice: Double) {
        productDescription.text = productDescriptionString
        productRatingCosmosVieww.rating = rating
        previousPriceLabel.attributedText = attributtedPreviousPrice(previousPrice)
        currentPriceLabel.text = String.localizedStringWithFormat("R$ %.2f", currentPrice)
        installmentPriceLabel.text = "\(maxInstallment)x de \(String.localizedStringWithFormat("%.2f", installmentPrice))"
    }
    
    private func attributtedPreviousPrice(_ previousPrice: Double) -> NSAttributedString{
        let formattedPreviousPrice = String.localizedStringWithFormat("R$ %.2f", previousPrice)
        let attributtedString = NSMutableAttributedString(string: formattedPreviousPrice)
        attributtedString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                       value: NSUnderlineStyle.single.rawValue,
                                       range: NSMakeRange(0, attributtedString.length))
        return attributtedString
    }

}
