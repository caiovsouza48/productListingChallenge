//
//  ProductAvaliationsContainerViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

final class AvaliationsContainerViewController: UIViewController {

    // MARK: - Child View Controller
    var productAvaliationMeanViewController: ProductAvaliationMeanViewController!
    var userAvaliationsTableViewController: ProductUserAvaliationsTableViewController!

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
                case .failure:
                    return
                case .success(let apiResponse):
                    self.setupProductAvaliationMeanViewController(rating: apiResponse.classificacao,
                        avaliationsCount: apiResponse.quantidade)
                    self.setupProductUserAvaliationsTableViewController(dataSource: apiResponse.opinioes)
                }
            }
        }
    }

    private func setupProductAvaliationMeanViewController(rating: Double, avaliationsCount: Int) {
        productAvaliationMeanViewController.productMeanPresentationController = ProductMeanPresentationController(ratingValue: rating,
                                              avaliationsCount: avaliationsCount)
    }
    
    private func setupProductUserAvaliationsTableViewController(dataSource: [Opiniao]) {
        userAvaliationsTableViewController.avaliationDataSourceController = AvaliationDataSourceController(dataSource: dataSource)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductAvaliationMeanViewController":
            productAvaliationMeanViewController = segue.destination as? ProductAvaliationMeanViewController
        case "ProductUserAvaliationsTableViewController":
            userAvaliationsTableViewController = segue.destination as? ProductUserAvaliationsTableViewController
        default:
            return
        }
    }

}
