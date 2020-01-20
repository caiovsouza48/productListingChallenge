//
//  AvaliationsAPIResponse.swift
//  ProductDetailsMVC
//
//  Created by Caio de Souza on 16/01/20.
//  Copyright © 2020 Caio de Souza. All rights reserved.
//

import Foundation

// MARK: - AvaliationsAPIResponse
struct AvaliationsAPIResponse: Codable {
    let classificacao: Double
    let quantidade: Int
    let opinioes: [Opiniao]
}

// MARK: - Opinioe
struct Opiniao: Codable {
    let cliente, data, comentario: String
    let nota: Int
    let titulo, avaliacaoGeral: String
    let like, dislike: Int
    let galeriaMidia: [GaleriaMidia]
    let idReview: Int
    let notaDescricao: String
}

// MARK: - GaleriaMidia
struct GaleriaMidia: Codable {
    let tipo, link: String
}
