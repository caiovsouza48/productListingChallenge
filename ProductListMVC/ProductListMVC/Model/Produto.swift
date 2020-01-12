//
//  Produto.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - Produto
struct Produto: Codable {
    let id, sku: Int
    let nome: String
    let disponivel: Bool
    let descricao: String
    let imagemURL: String
    let classificacao: Int
    let preco: Preco

    enum CodingKeys: String, CodingKey {
        case id, sku, nome, disponivel, descricao
        case imagemURL = "imagemUrl"
        case classificacao, preco
    }
}
