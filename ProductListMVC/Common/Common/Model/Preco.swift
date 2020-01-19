//
//  Preco.swift
//  Common
//
//  Created by Caio de Souza on 17/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - Preco
public struct Preco: Codable {
    public let planoPagamento: String
    public let valorParcela: Double
    public let quantidadeMaximaParcelas: Int
    public let precoAtual: Double
    public let precoAnterior: Double
    public let porcentagemDesconto: Int
}
