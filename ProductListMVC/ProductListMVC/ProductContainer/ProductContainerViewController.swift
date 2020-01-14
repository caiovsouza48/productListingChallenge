//
//  ViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

/// Container hosting all ViewControllers for the Product List Use Case
final class ProductContainerViewController: UIViewController {
    
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
                    self.offersCountViewController.offersCountPresentation = OffersCountPresentationController(offersCount: apiResponse.quantidade)
                    self.productCollectionViewController.productDatasourceController = ProductDatasourceController(dataSource: apiResponse.produtos)
                }
            }
        }
    }
    
    private func showAlert(forError error: Error) {
        let alertController = UIAlertController(title: "Ops",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let tryAgainAction = UIAlertAction(title: "Tentar Novamente", style: .default) { [unowned self] (action) in
            self.loadProducts()
        }
        alertController.addAction(tryAgainAction)
        alertController.addAction(OkAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "OffersCountViewController":
            self.offersCountViewController = segue.destination as? OffersCountViewController
        case "ProductCollectionViewController":
            self.productCollectionViewController = segue.destination as? ProductCollectionViewController
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

