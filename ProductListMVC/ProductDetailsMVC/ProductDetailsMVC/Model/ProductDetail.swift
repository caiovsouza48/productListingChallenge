//
//  ProductDetail.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 14/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - ProductDetails
struct ProductDetails: Codable {
    let id: Int
    let nome, descricao: String
    let retiraEmLoja: Bool
    let categorias: [Categoria]
    let maisInformacoes: [MaisInformacoes]
    let marca: Marca
    let modelo: Modelo
}

// MARK: - Categoria
struct Categoria: Codable {
    let id: Int
    let descricao: String
}

// MARK: - MaisInformacoes
struct MaisInformacoes: Codable {
    let descricao: String
    let valores: [Valores]
}

// MARK: - Valores
struct Valores: Codable {
    let nome, valor: String
}

// MARK: - Marca
struct Marca: Codable {
    let id: Int
    let nome: String
}

// MARK: - Modelo
struct Modelo: Codable {
    let padrao: Padrao
}

// MARK: - Padrao
struct Padrao: Codable {
    let sku: Int
    let nome: String
    let disponivel: Bool
    let marketplace: Marketplace
    let preco: Preco
    let imagens: [Imagem]
    let servicos: [Servico]
}

// MARK: - Imagem
struct Imagem: Codable {
    let id: Int
    let nome: String
    let altura, largura: Int
    let url: String
}

// MARK: - Marketplace
struct Marketplace: Codable {
    let maiorPreco, menorPreco: Int
    let lojistaPadrao: Lojista
    let lojistasEmDestaque: [Lojista]
}

// MARK: - Lojista
struct Lojista: Codable {
    let id: Int
    let nome: String
    let preco: Double
    let retiraRapido, compraOnline, eleito: Bool
}

// MARK: - Preco
struct Preco: Codable {
    let planoPagamento: String
    let valorParcela: Double
    let quantidadeMaximaParcelas: Int
    let precoAtual: Double
    let precoAnterior: Double
    let porcentagemDesconto: Int
    let descontoFormaPagamento: DescontoFormaPagamento
}

// MARK: - DescontoFormaPagamento
struct DescontoFormaPagamento: Codable {
    let preco: Double
    let possuiDesconto: Bool
    let porcentagemDesconto: Int
}

// MARK: - Servico
struct Servico: Codable {
    let nome: String
    let sku, idLojista: Int
    let preco: Double
    let parcelamento, tipo: String
}


