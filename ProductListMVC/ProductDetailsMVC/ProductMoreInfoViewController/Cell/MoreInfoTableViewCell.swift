//
//  MoreInfoTableViewCell.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

final class MoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var infoTitleLabel: UILabel!
    @IBOutlet var infoDescriptionLabel: UILabel!
    
    func configure(withTitle title: String?, infoDescription: String?) {
        infoTitleLabel.text = title
        infoDescriptionLabel.text = infoDescription
    }
    
}
