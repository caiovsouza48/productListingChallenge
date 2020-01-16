//
//  AvaliationTableViewCell.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Cosmos

class AvaliationTableViewCell: UITableViewCell {

    
    // MARK: - IBOutlets
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var cosmosRatingView: CosmosView!
    @IBOutlet private var descriptionLabel: UILabel!
    
    
    func configure(withDate date: String, username: String, rating: Double, descriptionString: String) {
        dateLabel.text = date
        usernameLabel.text = username
        cosmosRatingView.rating = rating
        descriptionLabel.text = descriptionString
        
    }
}
