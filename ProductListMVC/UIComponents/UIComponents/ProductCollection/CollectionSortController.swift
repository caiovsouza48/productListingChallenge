//
//  CollectionSortController.swift
//  UIComponents
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common

public enum CollectionSortOption: String {
    case popularidade = "popularidade"
    case descricao = "Descrição"
    case nome = "Nome"
    case preco = "Preço"
}

/// Controls Sort Logic, it posts via Observer when
public class CollectionSortController {
    private var datasourceController: DatasourceController<ProductFacade, ProductCollectionViewCell>
    
    public init(datasourceController: DatasourceController<ProductFacade, ProductCollectionViewCell>) {
        self.datasourceController = datasourceController
    }
    
    public func sort(by option: CollectionSortOption) {
        guard let keyPath = keyPathFor(option: option) else { return }
        datasourceController.models = datasourceController.models.sorted(by: keyPath)
    }
    
    /// Gets a KeyPath for a attributte
    /// - Parameter option: Selected Sort Option
    private func keyPathFor(option: CollectionSortOption) -> PartialComparableKeyPath<ProductFacade>? {
        
        switch option {
        case .nome:
            return PartialComparableKeyPath(\ProductFacade.displayName)
        case .preco:
            return PartialComparableKeyPath(\ProductFacade.displayCurrentPrice)
        case .descricao:
            return PartialComparableKeyPath(\ProductFacade.displayDescription!)
        default:
            return nil
        }
    }
    
}
