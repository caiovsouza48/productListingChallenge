//
//  MainCoordinator.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Core
import Common
import ProductDetailsMVC

class MainCoordinator: Coordinator {
    
    var parent: Coordinator?

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - ProductContainer
    
    func start() {
        let viewController = ProductContainerViewController.instantiate()
        setupProductContainerViewController(viewController)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    private func setupProductContainerViewController(_ viewController: ProductContainerViewController) {
        viewController.title = "Lista de Produtos"
        viewController.onProductSelected = { [unowned self] produto in
            self.goToProductDetails()
        }
    }
    
    // MARK: - Product Details
    
    private func goToProductDetails() {
        let productDetails = ProductDetailsContainerViewController.instantiate()
        // TODO: Set the Product
        navigationController.pushViewController(productDetails, animated: true)
    }

}

