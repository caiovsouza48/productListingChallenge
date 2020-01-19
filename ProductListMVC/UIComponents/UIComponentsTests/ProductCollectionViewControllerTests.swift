//
//  ProductCollectionViewControllerTests.swift
//  UIComponentsTests
//
//  Created by Caio de Souza on 19/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import XCTest
import Common
@testable import UIComponents

class ProductCollectionViewControllerTests: XCTestCase {
    // MARK: - Subject to be tested
    var subject: ProductCollectionViewController!

    var window: UIWindow!

    // MARK: - Setup

    override func setUp() {
        super.setUp()
        window = UIWindow()
        subject = .instantiate()
        _ = subject.view
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func loadView(){
        window.addSubview(subject.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Test Doubles
    class CollectionViewSpy: UICollectionView {
        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }

    func testSetDataSourceControllerShouldReloadViewController() {

        // Given
        let sampleLayout = UICollectionViewFlowLayout()
        let sampleFrame = CGRect(x: 1.0, y: 1.0, width: 1.0, height: 1.0)
        let collectionViewSpy = CollectionViewSpy(frame: sampleFrame,
            collectionViewLayout: sampleLayout)
        let dataSourceController: DatasourceController<ProductFacade, ProductCollectionViewCell> = .build(for: Seeds.ProductDataSource.dataSource)
        subject.collectionView = collectionViewSpy

        // When
        subject.productDatasourceController = dataSourceController

        // Then
        XCTAssert(collectionViewSpy.reloadDataCalled, "DatasourceController should reload data in collectionView")
    }

    func testCollectionViewCellShouldDisplayModelData() {
        // Given
        loadView()
        let collectionView = try! require(subject.collectionView)
        let product = Seeds.ProductDataSource.dataSource.first!
        let dataSourceController: DatasourceController<ProductFacade, ProductCollectionViewCell> = .build(for: Seeds.ProductDataSource.dataSource)
        subject.productDatasourceController = dataSourceController

        // When
        subject.collectionView.reloadData()
        let cell = collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as! ProductCollectionViewCell

        // Then
        XCTAssert(cell.currentPriceLabel.text == String.localizedStringWithFormat("%.2f", product.displayCurrentPrice), "Cell Should be configured to display the Rounded Current Price")

    }
}
