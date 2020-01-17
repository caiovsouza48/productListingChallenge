//
//  ViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import KRLCollectionViewGridLayout

/// Container hosting all ViewControllers for the Product List Use Case
final class ProductContainerViewController: UIViewController {
    
    // MARK: - Action Closure
    var onProductSelected: ((Produto) -> Void)?
    
    // MARK: - Child View Controllers
    var offersCountViewController: OffersCountViewController!
    var offerSortOptionsViewController: OfferSortOptionsViewController!
    var productCollectionViewController: ProductCollectionViewController!
    
    // MARK: - Controller
    
    var productContainerController: ProductContainerController = ProductContainerController()
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
    }
    
    private func loadProducts() {
        productContainerController.fetchProducts { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                   self.showAlert(forError: error)
                case .success(let apiResponse):
                    self.setupOffersCountViewController(offersCount: apiResponse.quantidade)
                    self.setupProductCollectionViewController(dataSource: apiResponse.produtos)
                }
            }
        }
    }
    
    private func setupOffersCountViewController(offersCount: Int) {
         self.offersCountViewController.offersCountPresentation = OffersCountPresentationController(offersCount: offersCount)
    }
    
    private func setupProductCollectionViewController(dataSource: [Produto]) {
        self.productCollectionViewController.productDatasourceController = ProductDatasourceController(dataSource: dataSource)
        let layout = KRLCollectionViewGridLayout()
        layout.numberOfItemsPerLine = 2
        layout.aspectRatio = 180.0 / 300.0
        layout.interitemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        layout.lineSpacing = 0
        productCollectionViewController.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func showAlert(forError error: Error) {
        let alertController = UIAlertController(title: "Ops",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let tryAgainAction = UIAlertAction(title: "Tentar Novamente", style: .default) { [unowned self] (_) in
            self.loadProducts()
        }
        alertController.addAction(tryAgainAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "OffersCountViewController":
            self.offersCountViewController = segue.destination as? OffersCountViewController
        case "ProductCollectionViewController":
            self.productCollectionViewController = segue.destination as? ProductCollectionViewController
            self.productCollectionViewController.onSelectItem = onProductSelected
        case "OfferSortOptionsViewController":
            self.offerSortOptionsViewController = segue.destination as? OfferSortOptionsViewController
            self.offerSortOptionsViewController.onPickerRowSelected = { [unowned self] selectedOption in
                self.productCollectionViewController.productDatasourceController.sortBy(option: selectedOption)
            }
        default:
            return
        }
    }
    
}
