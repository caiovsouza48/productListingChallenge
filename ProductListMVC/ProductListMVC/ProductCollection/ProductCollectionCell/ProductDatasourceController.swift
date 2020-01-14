//
//  ProductDatasourceControllerswift.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 13/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation
import Common
import class UIKit.UIImage

struct ProductDatasourceController {
    var dataSource: [Produto]
    
    func numberOfProducts() -> Int {
        return dataSource.count
    }
    
    func productAt(_ index: Int) -> Produto{
        assert(index >= 0, "Index Should be greater than zero")
        return dataSource[index]
    }
    
    func asyncImageFor(productUrl: String, completion: @escaping ((UIImage?) -> Void)) {
        guard let concreteURL = URL(string: productUrl) else { return }
        URLSession.shared.dataTask(with: concreteURL) { (data, urlResponse, error) in
            guard let data = data, error == nil else { return }
            let imageFromData = UIImage(data: data)
            completion(imageFromData)
        }.resume()
    }
    
    mutating func sortBy(option: String) {
        guard let keyPath = productKeyPathForOption(option) else { return }
        dataSource = dataSource.sorted(by: keyPath)
    }
    
    private func productKeyPathForOption(_ option: String) -> PartialComparableKeyPath<Produto>? {
        switch option {
        case "Nome":
            return PartialComparableKeyPath(\Produto.nome)
        case "Descrição":
            return PartialComparableKeyPath(\Produto.descricao)
        case "Preço":
            return PartialComparableKeyPath(\Produto.preco.precoAtual)
        default:
            return nil
        }
    }
}
