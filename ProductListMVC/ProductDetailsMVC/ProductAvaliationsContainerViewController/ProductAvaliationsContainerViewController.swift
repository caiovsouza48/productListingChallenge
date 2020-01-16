//
//  ProductAvaliationsContainerViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

final class ProductAvaliationsContainerViewController: UIViewController {

    // MARK: - Child View Controller
    var productAvaliationMeanViewController: ProductAvaliationMeanViewController!
    var productUserAvaliationsTableViewController: ProductUserAvaliationsTableViewController!

    // MARK: - Controller
    var avaliationsContainerController: AvaliationsContainerController = AvaliationsContainerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAvaliations()
    }

    private func loadAvaliations() {
        avaliationsContainerController.fetchAvaliations { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(_):
                    return
                case .success(let apiResponse):
                    self.setupProductAvaliationMeanViewController(rating: apiResponse.classificacao,
                        avaliationsCount: apiResponse.quantidade)
                    self.setupProductUserAvaliationsTableViewController(dataSource: apiResponse.opinioes)
                    break
                }
            }
        }
    }

    private func setupProductAvaliationMeanViewController(rating: Double, avaliationsCount: Int) {
        productAvaliationMeanViewController.productMeanPresentationController = ProductMeanPresentationController(ratingValue: rating, avaliationsCount: avaliationsCount)
    }
    
    private func setupProductUserAvaliationsTableViewController(dataSource: [Opiniao]) {
        productUserAvaliationsTableViewController.avaliationDataSourceController = AvaliationDataSourceController(dataSource: dataSource)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductAvaliationMeanViewController":
            productAvaliationMeanViewController = segue.destination as? ProductAvaliationMeanViewController
        case "ProductUserAvaliationsTableViewController":
            productUserAvaliationsTableViewController = segue.destination as? ProductUserAvaliationsTableViewController
        default:
            return
        }
    }

}
