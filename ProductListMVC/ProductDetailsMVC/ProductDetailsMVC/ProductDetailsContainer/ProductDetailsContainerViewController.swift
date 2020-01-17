//
//  ProductDetailsContainerViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common
import ScrollingContentViewController

public final class ProductDetailsContainerViewController: ScrollingContentViewController {

    // MARK: - Child View Controllers
    var productDetailsImagesViewController: ProductDetailsImagesViewController!
    var productDetailsNameViewController: ProductDetailsNameViewController!
    var productPriceViewController: ProductPriceViewController!
    var productDescriptionViewController: ProductDescriptionViewController!
    var productMoreInfoTableViewController: ProductMoreInfoTableViewController!

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
                        installmentPrice: apiResponse.modelo.padrao.preco.valorParcela, discountPercentage: apiResponse.modelo.padrao.preco.porcentagemDesconto)
                    // Description
                    self.setupProductDescriptionViewController(productDescription: apiResponse.descricao)

                    // More Info
                    self.productMoreInfoTableViewController.dataSourceController = MoreInfoDataSourceController(dataSource: apiResponse.maisInformacoes)
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

    private func setupProductPriceViewController(
        previousPrice: Double,
        currentPrice: Double,
        maxInstallment: Int,
        installmentPrice: Double,
        discountPercentage: Int) {
        productPriceViewController.productPricePresentation = ProductPricePresentation(previousPrice: previousPrice,
                                     currentPrice: currentPrice,
                                     maxInstallment: maxInstallment,
                                     installmentPrice: installmentPrice,
                                     discountPercentage: discountPercentage)
        let borderColor = UIColor(red: 244.0 / 255.0,
            green: 242 / 255.0,
            blue: 240 / 255.0,
            alpha: 1.0).cgColor
        productPriceViewController.view.layer.addBorder(edge: .top,
            color: borderColor,
            thickness: 1.0)
    }

    private func setupProductDescriptionViewController(productDescription: String?) {
        let borderColor = UIColor(red: 244.0 / 255.0,
            green: 242 / 255.0,
            blue: 240 / 255.0,
            alpha: 1.0).cgColor
        productDescriptionViewController.view.layer.addBorder(edge: .top,
            color: borderColor,
            thickness: 1.0)
        productDescriptionViewController.descriptionLabel.text = productDescription
    }

    private func showAlert(forError error: Error) {
        let alertController = UIAlertController(title: "Ops",
            message: error.localizedDescription,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let tryAgainAction = UIAlertAction(title: "Tentar Novamente", style: .default) { [unowned self] (_) in
            self.loadProductDetails()
        }
        alertController.addAction(tryAgainAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ProductDetailsImagesViewController":
            productDetailsImagesViewController = segue.destination as? ProductDetailsImagesViewController
        case "ProductDetailsNameViewController":
            productDetailsNameViewController = segue.destination as? ProductDetailsNameViewController
        case "ProductPriceViewController":
            productPriceViewController = segue.destination as? ProductPriceViewController
        case "ProductDescriptionViewController":
            productDescriptionViewController = segue.destination as? ProductDescriptionViewController
        case "ProductMoreInfoTableViewController":
            productMoreInfoTableViewController = segue.destination as? ProductMoreInfoTableViewController
        default:
            return
        }
    }

}
