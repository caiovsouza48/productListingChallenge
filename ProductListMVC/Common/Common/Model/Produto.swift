//
//  Produto.swift
//  Common
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - Produto
public struct Produto: Codable {
    public let id, sku: Int
    public let nome: String
    public let disponivel: Bool?
    public let descricao: String?
    public let imagemURL: String
    public let classificacao: Double
    public let preco: Preco

    enum CodingKeys: String, CodingKey {
        case id, sku, nome, disponivel, descricao
        case imagemURL = "imagemUrl"
        case classificacao, preco
    }
}

// MARK: - Product Facade
extension Produto: ProductFacade {
    
    public var displayName: String { return nome }
    
    public var displayDescription: String? { return descricao }
    
    public var displayPreviusPrice: Double { return preco.precoAnterior }
    
    public var displayCurrentPrice: Double { return preco.precoAtual }
    
    public var displayInstallment: String { return "\(preco.quantidadeMaximaParcelas)x de \(String(format: "R$ %.2f", preco.valorParcela))"
    }
    
    public var displayImageURL: String { return imagemURL }
    
    public var displayRating: Double { return classificacao }
    
}
