//
//  ProductContainerListViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import UIComponents

final class ProductContainerListViewController: UIViewController {
    
    // MARK: - Child View Controller
    var productCollectionViewController: ProductCollectionViewController!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductCollectionViewController": break
            
        default:
            break
        }
    }
}
