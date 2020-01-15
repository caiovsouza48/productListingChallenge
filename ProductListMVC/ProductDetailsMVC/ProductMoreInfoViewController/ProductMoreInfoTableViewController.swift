//
//  ProductMoreInfoTableViewController.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 15/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import UIKit
import Common

/// Displays the More Info from Product in a Table View with Sections
final class ProductMoreInfoTableViewController: UITableViewController {

    var dataSourceController: MoreInfoDataSourceController = MoreInfoDataSourceController(dataSource: []) {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TitleLabelHeader", bundle: Bundle(for: type(of: self))), forHeaderFooterViewReuseIdentifier: "TitleLabelHeader")
        tableView.registerNibFileBasedCell(cellType: MoreInfoTableViewCell.self)


    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame.size.height = tableView.contentSize.height
        tableView.isScrollEnabled = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSourceController.numberOfInfos()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceController.numberOfValues(forSection: section)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MoreInfoTableViewCell.self)
        let value = dataSourceController.moreInfoValueAt(indexPath.row, section: indexPath.section)
        cell.configure(withTitle: value.nome,
            infoDescription: MoreInfoDataPresentationController.replacedValueDescription(value: value.valor,
                withRegex: "\\s+$"))

        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleLabelHeader") as? TitleLabelHeader
        header?.titleLabel.text = dataSourceController.infoAt(section).descricao.uppercased()
        return header
    }
}
