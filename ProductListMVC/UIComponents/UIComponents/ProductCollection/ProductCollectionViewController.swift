//
//  ProductCollectionViewController.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common
import KRLCollectionViewGridLayout

public class ProductCollectionViewController: UICollectionViewController {

    // MARK: - Action Closure
    public var onSelectItem: (() -> Void)?

    // MARK: - Variables
    lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()

    /// Set True to border the UICollectionViewCells
    public var bordered: Bool = true

    // MARK: - Controllers

    public var productDatasourceController: DatasourceController<ProductFacade, ProductCollectionViewCell> = .buildEmpty() {
        didSet { collectionView.reloadData() }
    }

    public var sortController: CollectionSortController?

    // MARK: - View Lifecycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        registerProductDataSourceObserver()
        self.collectionView.registerNibFileBasedCell(cellType: ProductCollectionViewCell.self)
    }

    private func registerProductDataSourceObserver() {
        notificationCenter.addObserver(self,
            selector: #selector(dataSourceChanged(_:)),
            name: .ProductDatasourceUpdated,
            object: nil)
    }

    @objc func dataSourceChanged(_ notification: Notification) {
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDatasourceController.models.count
    }

    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ProductCollectionViewCell.self)
        productDatasourceController.configure(cell: cell, forIndexPath: indexPath)
        if bordered { cell.setupBorder() }
        return cell
    }

    override public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelectItem?()
    }

}
