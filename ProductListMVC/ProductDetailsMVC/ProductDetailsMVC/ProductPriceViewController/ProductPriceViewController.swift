//
//  ProductPriceViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

/// Controls the display of Price on productDetails
class ProductPriceViewController: UIViewController {
    
    // MARK: - Controller
    var productPricePresentation: ProductPricePresentation = ProductPricePresentation(previousPrice: 0.0, currentPrice: 0.0, maxInstallment: 1, installmentPrice: 0.0) {
        didSet {
            setupOldPrice()
            setupCurrentPrice()
            setupInstallmentPriceLabel()
        }
        
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet var oldPriceLabel: UILabel!
    @IBOutlet var currentPriceLabel: UILabel!
    @IBOutlet var installmentPriceLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOldPrice()
        setupCurrentPrice()
        setupInstallmentPriceLabel()
    }
    
    private func setupOldPrice() {
        oldPriceLabel.attributedText = productPricePresentation.attributtedStrikethroughPreviousPrice()
    }
    
    private func setupCurrentPrice() {
        currentPriceLabel.text = productPricePresentation.currentPriceString()
    }
    
    private func setupInstallmentPriceLabel() {
        installmentPriceLabel.text = productPricePresentation.installmentTextString()
    }
}
