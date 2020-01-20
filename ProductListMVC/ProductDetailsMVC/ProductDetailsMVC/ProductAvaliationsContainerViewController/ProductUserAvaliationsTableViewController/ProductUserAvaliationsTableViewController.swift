//
//  ProductUserAvaliationsTableViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common

final class ProductUserAvaliationsTableViewController: UITableViewController {
    
    var avaliationDataSourceController: AvaliationDataSourceController = AvaliationDataSourceController(dataSource: []) {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibFileBasedCell(cellType: AvaliationTableViewCell.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avaliationDataSourceController.numberOfAvaliations()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath,
                                                 cellType: AvaliationTableViewCell.self)
        let avaliation = avaliationDataSourceController.avaliationAt(indexPath.row)
        cell.configure(withDate: avaliation.data,
                       username: avaliation.cliente,
                       rating: Double(avaliation.nota),
                       descriptionString: avaliation.notaDescricao)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: .zero)
        return view
    }
}
