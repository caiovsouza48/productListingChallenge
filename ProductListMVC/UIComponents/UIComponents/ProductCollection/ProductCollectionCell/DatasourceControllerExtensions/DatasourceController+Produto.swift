//
//  DatasourceController+Produto.swift
//  UIComponents
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common
import class UIKit.UIImage
import class Networking.AsyncImageDownloader

extension DatasourceController where Model == ProductFacade,
    CellType == ProductCollectionViewCell {
        public static func build(for products: [ProductFacade]) -> DatasourceController {
            return DatasourceController(
                models: products
            ) { (product, cell) in
                AsyncImageDownloader.download(urlString: product.displayImageURL) { (image) in
                    DispatchQueue.main.async {
                        cell.productImageView.image = image ?? UIImage(named:"noImage")
                        
                    }
                }
                cell.configure(
                    withDescription: product.displayDescription,
                    rating: product.displayRating,
                    previousPrice: product.displayPreviusPrice,
                    currentPrice: product.displayCurrentPrice,
                    installmentString: product.displayInstallment
                )
            }
        }
}
