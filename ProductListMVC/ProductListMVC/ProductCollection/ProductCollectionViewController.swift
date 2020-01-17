//
//  ProductCollectionViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import KRLCollectionViewGridLayout

final class ProductCollectionViewController: UICollectionViewController {
    
    // MARK: - Action Closure
    var onSelectItem: ((Produto) -> Void)?
    
    // MARK: - Variables
    var productDatasourceController: ProductDatasourceController = ProductDatasourceController(dataSource: []) {
        didSet { collectionView.reloadData() }
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.registerNibFileBasedCell(cellType: ProductCollectionViewCell.self)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDatasourceController.numberOfProducts()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ProductCollectionViewCell.self)
        let product = productDatasourceController.productAt(indexPath.item)
        productDatasourceController.asyncImageFor(productUrl: product.imagemURL) { (image) in
            DispatchQueue.main.async { cell.productImageView.image = image }
        }
        cell.configure(withDescription: product.descricao,
                       rating: product.classificacao,
                       previousPrice: product.preco.precoAnterior,
                       currentPrice: product.preco.precoAtual,
                       maxInstallment: product.preco.quantidadeMaximaParcelas,
                       installmentPrice: product.preco.valorParcela)
    
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let produto = productDatasourceController.productAt(indexPath.item)
        onSelectItem?(produto)
    }
}
