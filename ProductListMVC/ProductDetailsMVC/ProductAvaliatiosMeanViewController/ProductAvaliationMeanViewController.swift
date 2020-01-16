//
//  ProductAvaliationMeanViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Cosmos

/// Displays the Avaliation Mean of the Product
final class ProductAvaliationMeanViewController: UIViewController {
    
    // MARK: - Controller
    var productMeanPresentationController: ProductMeanPresentationController = ProductMeanPresentationController(ratingValue: 0.0, avaliationsCount: 0) {
        didSet {
            setupMeanValueLabel()
            setupCosmosRatingView()
            setupAvaliationCountLabel()
        }
    }
    
    // MARK: - IBOutlets

    @IBOutlet var meanValueLabel: UILabel!
    @IBOutlet var cosmosRatingView: CosmosView!
    @IBOutlet var avaliationsCountLabel: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMeanValueLabel()
        setupCosmosRatingView()
        setupAvaliationCountLabel()
    }
    
    private func setupMeanValueLabel() {
        meanValueLabel.text = productMeanPresentationController.formattedRatingValue()
    }
    
    private func setupCosmosRatingView() {
        cosmosRatingView.rating = productMeanPresentationController.ratingValue
        var settings = CosmosSettings()
        settings.fillMode = .half
        cosmosRatingView.settings = settings
    }
    
    private func setupAvaliationCountLabel() {
        avaliationsCountLabel.text = productMeanPresentationController.formattedAvaliationCount()
    }

}
