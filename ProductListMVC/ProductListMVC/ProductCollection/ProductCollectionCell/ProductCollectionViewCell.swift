//
//  ProductCollectionViewCell.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
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
        // Initialization code
    }
    
    func configure(withImage image: UIImage,
                   description: String?,
                   rating: Double,
                   previousPrice: String?,
                   currentPrice: String?,
                   installment: String?) {
        productImageView.image = image
        productDescription.text = description
        productRatingCosmosVieww.rating = rating
        previousPriceLabel.text = previousPrice
        currentPriceLabel.text = currentPrice
        installmentPriceLabel.text = installment
        
    }

}
