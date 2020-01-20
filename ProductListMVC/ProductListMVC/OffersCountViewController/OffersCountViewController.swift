//
//  OffersCountViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

/// Display a View With a Label containing the quantity of Offers
final class OffersCountViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var offersCountLabel: UILabel!
    
    // MARK: - Variables
    var offersCountPresentation: OffersCountPresentationController = OffersCountPresentationController(offersCount: 0) {
        didSet {
            setupOffersCountLabel()
        }
    }
    
    // MARK: - View Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOffersCountLabel()
    }
    
    /// Updates the Offers Count Label
    private func setupOffersCountLabel() {
        offersCountLabel.text = offersCountPresentation.formattedOffersCount()
    }

}
