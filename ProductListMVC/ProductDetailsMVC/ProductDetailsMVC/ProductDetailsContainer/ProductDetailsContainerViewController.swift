//
//  ProductDetailsContainerViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit

public final class ProductDetailsContainerViewController: UIViewController {
    
    // MARK: - Child View Controllers
    var productDetailsImagesViewController: ProductDetailsImagesViewController!
    var productDetailsNameViewController: ProductDetailsNameViewController!
    var productPriceViewController: ProductPriceViewController!
    
    // MARK: - Controller
    var productDetailsContainerController: ProductDetailsContainerController = ProductDetailsContainerController()
    
    // MARK: - View Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        loadProductDetails()
    }
    
    private func loadProductDetails() {
        productDetailsContainerController.fetchProductDetails { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                   self.showAlert(forError: error)
                case .success(let apiResponse):
                    // Images
                    self.setupProductDetailsImagesViewController(images: apiResponse.modelo.padrao.imagens)
                    // Description
                    self.setupProductDetailsNameViewController(name: apiResponse.nome,
                                                          code: apiResponse.modelo.padrao.sku)
                    // Price
                    self.setupProductPriceViewController(previousPrice: apiResponse.modelo.padrao.preco.precoAnterior,
                                                         currentPrice: apiResponse.modelo.padrao.preco.precoAtual,
                                                         maxInstallment: apiResponse.modelo.padrao.preco.quantidadeMaximaParcelas,
                                                         installmentPrice: apiResponse.modelo.padrao.preco.valorParcela)
                }
            }
        }
    }
    
    private func setupProductDetailsNameViewController(name: String?, code: Int) {
        productDetailsNameViewController.nameLabel.text = name
        productDetailsNameViewController.codeLabel.text = "Cód. Item \(code)"
    }
    
    private func setupProductDetailsImagesViewController(images: [Imagem]) {
        productDetailsImagesViewController.imagesDataSourceController = ImagesDataSourceController(images: images)
    }
    
    private func setupProductPriceViewController(previousPrice: Double,
                                                 currentPrice: Double,
                                                 maxInstallment: Int,
                                                 installmentPrice: Double) {
        productPriceViewController.productPricePresentation = ProductPricePresentation(previousPrice: previousPrice, currentPrice: currentPrice, maxInstallment: maxInstallment, installmentPrice: installmentPrice)
        
    }
    
    private func showAlert(forError error: Error) {
        let alertController = UIAlertController(title: "Ops",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let tryAgainAction = UIAlertAction(title: "Tentar Novamente", style: .default) { [unowned self] (action) in
            self.loadProductDetails()
        }
        alertController.addAction(tryAgainAction)
        alertController.addAction(OkAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductDetailsImagesViewController":
            self.productDetailsImagesViewController = segue.destination as? ProductDetailsImagesViewController
        case "ProductDetailsNameViewController":
            self.productDetailsNameViewController = segue.destination as? ProductDetailsNameViewController
        case "ProductPriceViewController":
            self.productPriceViewController = segue.destination as? ProductPriceViewController
        default:
            return
        }
    }

}
