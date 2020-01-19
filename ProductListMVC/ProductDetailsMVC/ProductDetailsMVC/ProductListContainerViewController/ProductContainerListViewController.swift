//
//  ProductContainerListViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common
import UIComponents

final class ProductContainerListViewController: UIViewController {

    // MARK: - Child View Controller
    var productCollectionViewController: ProductCollectionViewController!

    // MARK: - Controller
    var productController: ProductContainerListController!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()

        productController.fetchProducts { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let produtos):
                    self.productCollectionViewController.bordered = false
                    self.productCollectionViewController.productDatasourceController = .build(for: produtos)
                case .failure: break
                }
            }
        }
    }

    func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 0.0
        layout.itemSize = CGSize(width: 200, height: 250)
        layout.scrollDirection = .horizontal
        productCollectionViewController.collectionView.setCollectionViewLayout(layout, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductCollectionViewController":
            productCollectionViewController = segue.destination as? ProductCollectionViewController
        default:
            break
        }
    }
}
