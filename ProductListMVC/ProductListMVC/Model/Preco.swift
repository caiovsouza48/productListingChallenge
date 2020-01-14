//
//  Preco.swift
//  ProductListMVC
//
//  Created by Caio de Souza on 12/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - Preco
struct Preco: Codable {
    let planoPagamento: String
    let valorParcela: Double
    let quantidadeMaximaParcelas: Int
    let precoAtual: Double
    let precoAnterior: Double
    let porcentagemDesconto: Int
}
