//
//  DatasourceController.swift
//  Common
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import UIKit

/// Defines a Generic DatasourceController
public class DatasourceController<Model, CellType>: NSObject {
    // MARK: - Alias
    public typealias CellConfigurator = (Model, CellType) -> Void

    // MARK: - Variables

    lazy var notificationCenter: NotificationCenter = {
        return NotificationCenter.default
    }()
    
    /// Models controlled by this class via generics, it Posts a .ProductDatasourceUpdated
    /// notification via Observer. I Choose Observer because it avoid the View to be aware of the Model type
    public var models: [Model] { didSet { notificationCenter.post(name: .ProductDatasourceUpdated, object: nil) }
    }

    public let cellConfigurator: CellConfigurator
    
    // MARK: Lifecycle
    
    public static func buildEmpty() -> DatasourceController {
        return DatasourceController(models: []) { (_, _) in }
    }

    public init(models: [Model],
                cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    public func configure(cell: CellType, forIndexPath indexPath: IndexPath) {
        let model = models[indexPath.row]
        cellConfigurator(model, cell)
    }
}
