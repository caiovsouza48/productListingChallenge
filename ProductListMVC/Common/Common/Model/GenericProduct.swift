//
//  ShopTogetherProductElement.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 18/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - GenericProduct
public struct GenericProduct: Codable {
    public let id, sku: Int
    public let nome: String
    public let imagemURL: String
    public let precoAtual, precoAnterior: Double
    public let percentualCompra: Int
    public let classificacao: Double
    public let parcelamento: String

    enum CodingKeys: String, CodingKey {
        case id, sku, nome
        case imagemURL = "imagemUrl"
        case precoAtual, precoAnterior, percentualCompra, classificacao, parcelamento
    }
}

public typealias GenericProductAPIResponse = [GenericProduct]

// MARK: - Product Facade

extension GenericProduct: ProductFacade {
    
    public var displayName: String { return nome }
    
    public var displayDescription: String? { return nil }
    
    public var displayPreviusPrice: Double { return precoAnterior }
    
    public var displayCurrentPrice: Double { return precoAtual }
    
    public var displayInstallment: String { return parcelamento }
    
    public var displayImageURL: String { return imagemURL }
    
    public var displayRating: Double { return classificacao }
    
}
